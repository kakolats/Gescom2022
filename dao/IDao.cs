using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gestion_Com_2022.dao
{
    public interface IDao<T>
    {
        int insert(T obj);
        int update(T obj);
        int delete(int id);
        DataTable findAll();
        T findById(int id);
    }
}
