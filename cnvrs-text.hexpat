struct Entry {
  u64 entry_uid;
  u64 entry_name_offset;
  u64 second_entry_offset;
  u64 text_offset;
  u64 text_length;
  u64 unk;
};

struct SheetHeader {
  u8 unk;
  u8 sheet_id;
  u16 entry_count;
  u32 unk2;
  u64 header_size;
  u64 sheet_name_offset;
  u64 unk4;
};

struct Sheet {
  SheetHeader header;
  Entry entry[header.entry_count];
};

struct DataHeader {
  char signature[4];
  u32 data_table_size;
  u32 data_size;
  u32 unk;
  u32 unk2;
  u32 unk3;
  u64 unk4[3];
};

struct Data {
  DataHeader header;
  Sheet sheet;
};

struct FileHeader {
  char signature[8];
  u32 file_size;
  u32 data_table_count;
};

struct File {
  FileHeader header;
  Data data_table[header.data_table_count];
};

File file @0x0;