db.getCollection('Personas').find({WasBlocked:true,IsPublic:true},{CreatedOn:1,Site:1,_id:0,DisplayName:1,UserName:1,UpdateDate:1})
