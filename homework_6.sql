Задача 1. Разблокировать юзеров из `France` и `Germany` с положительным балансом
	db.users.updateMany(
    {
        country: { $in: ['France', 'Germany'] },
        balance: { $gte: 0 }
    },
    { $unset: { is_blocked: null } }
)
Задача 2. Вывести названия двух произвольных треков
	db.tracks.aggregate([
    { $sample: { size: 2 } },
    { $project: { title: 1, _id: 0 } }
])
Задача 3. Вывести юзеров, у которых есть треки
	db.users.aggregate([
    {
        $lookup: {
            from: 'tracks', // название коллекции
            localField: '_id',
            foreignField: 'author_id',
            as: 'tracks' // куда поместить результат
        }
    },
    { $project: { fullname: 1, tracks: 1, _id: 0 } }
  
])
Задача 4. Используя метод `aggregate()`, вывести ко-во юзеров без треков
	
	db.users.aggregate([
    {
        $lookup: {
            from: 'tracks', // название коллекции
            localField: '_id',
            foreignField: 'author_id',
            as: 'tracks' // куда поместить результат
        }
    },
    { $match: { tracks: [] } },
	{ $count: 'users_count' }
])