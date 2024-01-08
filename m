Return-Path: <jailhouse-dev+bncBC7Y32GTCIIMHY7OVQDBUBECPUGTU@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb38.google.com (mail-yb1-xb38.google.com [IPv6:2607:f8b0:4864:20::b38])
	by mail.lfdr.de (Postfix) with ESMTPS id 421ED82696C
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Jan 2024 09:26:45 +0100 (CET)
Received: by mail-yb1-xb38.google.com with SMTP id 3f1490d57ef6-dbed0713422sf509309276.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Jan 2024 00:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1704702404; x=1705307204; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDDSaH7jUSRF4jW89AebTv9Hucpubz0bxBewNT7uyVY=;
        b=j/xIWXkQO0D0KqgnKom9QOHB3hlXYTxum1BB3eofDR+3Rh2aRlDwYvhBZWHfKmTDjA
         hpbKQerI+d59Z150LSnx7WrFoiHpkllIdOalcYMEtXeHUzGj6m5SfH1JXhNCxirsmfB3
         D9Dy9gN7Se8tCNQwvdA0L1gmjrNpbdHvWv8wd4+eNIjQHdgLuIDQJ1ua0re8p3muN9HH
         T9i29Cf7eU1w6hrhNEoPfuI5A1iKEziSuC9CUrXEm5m6tyVfp9wBVolPI97VVe9tzruA
         wPk9SXINJsWUQestUPdyNDZt6iVdHGsdFiupvszcv7yVlYgvPefOBrw/icsswJ+Qqomy
         wPFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704702404; x=1705307204; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DDDSaH7jUSRF4jW89AebTv9Hucpubz0bxBewNT7uyVY=;
        b=hqPru3rEf0ulWiR9mwCTjD/irCI0KQbck2VUKnJ8py5SF767NInM5+yhPDcrWbETVh
         Vy1SwStnoPkpLPFAoNxkV7ftnYu25MnhhBFgaYnUNsSNHYrp3kwk31IVoFtRC3fa2wZN
         YadFHGg/5vijV1WMWkObN0pjvgdqNXViexPzp3RPZVGFTsQtroH8ejjrp2dYF6b1AtoB
         avLyMbsrAcmsuRFe5JTNekRCongrDT3dhsjgy1zRxv+0XTkD54tb5H+yaU6uvbNcv8Z5
         3F3Hp/7F3DXd1kzU5kjCOv9umj7WncBDWxg8yTsSVKdWlka+t5s30IWGTQUkr5biRKC5
         o8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704702404; x=1705307204;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDDSaH7jUSRF4jW89AebTv9Hucpubz0bxBewNT7uyVY=;
        b=fMZJRJJwtgErPbhjykYog/dQ3rTLje+wR2XO1Ui98QlFhUFrtv8smctFW7Gb9oA8Vv
         zwrFS38bfEiSyaCiIiaMO759uEku+HDHKv68elP4txJDedw7MRtXmD4Ku56VUu+k63ed
         RBT+OUezXpcn5KXB9J7Q3ULYTKAYkjlJ5/YSg5nRRz6BUkw8zdEEen+1huZxjA9uAigd
         pFCwa6w0f89cjWvh1q/CJ4asO6fqood8gv5mCvq7JvWo88y5+VoYtiXB5gRzRBSe0PEE
         MaufeIhOla+7nWwAB6WYjHfcz5mB0QozQHDAet59IeDgqw49jA+E/4zhTXDYAo0FvfkJ
         juvw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YwRHg380m76jU52Y8YRLgaWKnm+cii1+CUkSUzAnMa7plGJ9JQe
	bnZpQI2UcYKKVVIkZhzGhHI=
X-Google-Smtp-Source: AGHT+IHrKO096zWQrTTUCGdAMRHxPFvMC2B59UnXWO+XJZtSlg9UZO8YdwKpVxsAgv1D8C6L3L/UbA==
X-Received: by 2002:a5b:c0e:0:b0:dbd:c1d6:3e17 with SMTP id f14-20020a5b0c0e000000b00dbdc1d63e17mr764619ybq.47.1704702403814;
        Mon, 08 Jan 2024 00:26:43 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:d291:0:b0:dbd:45cd:e49f with SMTP id j139-20020a25d291000000b00dbd45cde49fls323204ybg.0.-pod-prod-03-us;
 Mon, 08 Jan 2024 00:26:42 -0800 (PST)
X-Received: by 2002:a05:690c:88a:b0:5d6:cb62:4793 with SMTP id cd10-20020a05690c088a00b005d6cb624793mr1628132ywb.0.1704702401976;
        Mon, 08 Jan 2024 00:26:41 -0800 (PST)
Date: Mon, 8 Jan 2024 00:26:41 -0800 (PST)
From: wheatfox <enkerewpo@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <f81eedab-debe-4d19-954a-06b55f2fa4a9n@googlegroups.com>
Subject: i.MX8MP jailhouse load image stuck at copy_from_user
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_88217_743477884.1704702401378"
X-Original-Sender: Enkerewpo@gmail.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

------=_Part_88217_743477884.1704702401378
Content-Type: multipart/alternative; 
	boundary="----=_Part_88218_51637466.1704702401379"

------=_Part_88218_51637466.1704702401379
Content-Type: text/plain; charset="UTF-8"

I'm using OK8MP board with i.MX8MP CPU. I have already started jailhouse 
with imx8mp.cell configuration, and the example gic-demo works fine. 
However, when I try to start a linux inmate using imx8mp-linux-demo.cell, 
the jailhouse's load progress seems stuck.

After adding some debug print in jailhouse's python script, firmware code 
and kernel module code, I found out that the *copy_from_user* call in 
*load_image* function (driver/cell.c) doesn't return and halt forever:

jailhouse commands:
./tools/jailhouse enable ./imx8mp.cell
./tools/jailhouse cell linux \
./imx8mp-linux-demo.cell \
./kernel/Image \
-i ./kernel/ramdisk.img \
-d ./kernel/imx8mp-evk-inmate-wheatfox.dtb \
-c "clk_ignore_unused console=ttymxc1,0x30890000,115200 
earlycon=ec_imx6q,0x30890000,115200"

start linux cell output(with the string 'wheatfox' means it's my custom 
debug print):
root@OK8MP:/mnt# ./start-linux.sh 
[wheatfox|python] Jailhouse Linux Cell Boot Helper
[wheatfox|python] linux_loader=/m[  129.965933] [wheatfox] 
(jailhouse_ioctl) ioctl=0x5401 arg=281474720244744
nt/tools/../inmates/tools/arm64/l[  129.975611] [wheatfox] 
(jailhouse_ioctl) ioctl=0x5401 arg=281474720244728
inux-loader.bin
[  129.988033] [wheatfox] (jailhouse_ioctl) ioctl=0x40100002 
arg=281474720244800
[  129.995192] [wheatfox] (jailhouse_ioctl) JAILHOUSE_CELL_CREATE
[  130.001072] [wheatfox] (jailhouse_cmd_cell_create) start
[  130.006404] [wheatfox] (jailhouse_cmd_cell_create) copy_from_user done
[  130.012960] [wheatfox] (jailhouse_cmd_cell_create) copy_from_user done
[  130.019507] [wheatfox] (jailhouse_cmd_cell_create) cell_id.id = -1
[  130.095151] IRQ 6: no longer affine to CPU2
[  130.095333] CPU2: shutdown
[  130.102251] psci: CPU2 killed (polled 0 ms)
[  130.155283] CPU3: shutdown
[  130.157999] psci: CPU3 killed (polled 0 ms)
[wheatfox] in hypercall, code = 1, arg1 = 2955416576, arg2 = 2
[wheatfox] in hypercall, JAILHOUSE_HC_CELL_CREATE
Adding virtual PCI device 00:00.0 to cell "linux-inmate-demo"
Shared memory connection established, peer cells:
 "imx8mp"
Adding virtual PCI device 00:01.0 to cell "linux-inmate-demo"
Shared memory connection established, peer cells:
 "imx8mp"
[wheatfox] in resume_cpu, cpu_id = 2
[wheatfox] in resume_cpu, target_data->cpu_suspended = 1
[wheatfox] in resume_cpu, cpu_id = 3
[wheatfox] in resume_cpu, target_data->cpu_suspended = 1
Created cell "linux-inmate-demo"
Page pool usage after cell creation: mem 82/992, remap 144/131072
[wheatfox] in resume_cpu, cpu_id = 0
[wheatfox] in resume_cpu, target_data->cpu_suspended = 1
[  130.231800] [wheatfox] (jailhouse_cmd_cell_create) Created cell 
"linux-inmate-demo"
[wheatfox|python] cell created, 
name=b'linux-inmate-demo\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
[wheatf[  130.249264] [wheatfox] (jailhouse_ioctl) ioctl=0x40300003 
arg=281474720245360
ox|python] trying to load linux_l[  130.257905] [wheatfox] 
(jailhouse_ioctl) JAILHOUSE_CELL_LOAD
oader.bin into cell, addr=0x0
[  130.266684] [wheatfox] (jailhouse_cmd_cell_load) start
[  130.274322] [wheatfox] (jailhouse_cmd_cell_load) 
cell_management_prologue(&cell_load.cell_id, &cell) done
[wheatfox] in hypercall, code = 3, arg1 = 1, arg2 = 4308871775073466112
[wheatfox] in hypercall, JAILHOUSE_HC_CELL_SET_LOADABLE
[wheatfox] in cell_set_loadable, id = 1
[wheatfox] cell_management_prologue finished
[wheatfox] in resume_cpu, cpu_id = 2
[wheatfox] in resume_cpu, target_data->cpu_suspended = 1
[wheatfox] in resume_cpu, cpu_id = 3
[wheatfox] in resume_cpu, target_data->cpu_suspended = 1
[wheatfox] finished arch_park_cpu
[wheatfox] cell->loadable = 0
[wheatfox] not jumped to out_resume
Cell "linux-inmate-demo" can be loaded
[wheatfox] in out_resume
[wheatfox] in resume_cpu, cpu_id = 1
[wheatfox] in resume_cpu, target_data->cpu_suspended = 1
[  130.342417] [wheatfox] (jailhouse_cmd_cell_load) 
jailhouse_call_arg1(JAILHOUSE_HC_CELL_SET_LOADABLE, cell->id) done
[  130.353079] [wheatfox] (jailhouse_cmd_cell_load) 
cell_load.num_preload_images = 1
[  130.360584] [wheatfox] (jailhouse_cmd_cell_load) load_image(cell, image) 
start, n = 1
[  130.368444] [wheatfox] (load_image) start
[  130.372468] [wheatfox] (load_image) copy_from_user done
[  130.377712] [wheatfox] (load_image) image.size = 34b0
[  130.382776] [wheatfox] (load_image) found suitable memory region, 
mem->virt_start = 0, mem->size = 10000
[  130.392280] [wheatfox] (load_image) image load mem region found
[  130.398228] [wheatfox] (load_image) phys_start = fdb00000
[  130.403653] [wheatfox] (load_image) page_offs = 0
[  130.408373] [wheatfox] (load_image) image_mem = 0000000079dd6ce3
[  130.414405] [wheatfox] (load_image) copy_from_user params:
[  130.419905] [wheatfox] (load_image) to = 0000000079dd6ce3
[  130.425329] [wheatfox] (load_image) from = 00000000c239ec71
[  130.430915] [wheatfox] (load_image) n = 34b0
[  130.435220] [wheatfox] (load_image) copy_from_user start
[  130.440563] [wheatfox] (load_image) copy_from_user done
[  130.445822] [wheatfox] (load_image) flush_icache_range done
[  130.451429] [wheatfox] (jailhouse_cmd_cell_load) load_image(cell, image) 
done, n = 1
[  130.459186] [wheatfox] (jailhouse_cmd_cell_load) unlock_out done, 
exiting jailhouse_cmd_cell_load
[wheatfox|python] linux_loader.bin loaded
[wheatfox|python] trying to load kernel into cell, addr=0xc0280000
[  130.500262] [wheatfox] (jailhouse_ioctl) ioctl=0x40300003 
arg=281474720245360
[  130.507454] [wheatfox] (jailhouse_ioctl) JAILHOUSE_CELL_LOAD
[  130.513165] [wheatfox] (jailhouse_cmd_cell_load) start
[  130.518321] [wheatfox] (jailhouse_cmd_cell_load) 
cell_management_prologue(&cell_load.cell_id, &cell) done
[wheatfox] in hypercall, code = 3, arg1 = 1, arg2 = 4308871775073466112
[wheatfox] in hypercall, JAILHOUSE_HC_CELL_SET_LOADABLE
[wheatfox] in cell_set_loadable, id = 1
[wheatfox] cell_management_prologue finished
[wheatfox] in resume_cpu, cpu_id = 2
[wheatfox] in resume_cpu, target_data->cpu_suspended = 1
[wheatfox] in resume_cpu, cpu_id = 3
[wheatfox] in resume_cpu, target_data->cpu_suspended = 1
[wheatfox] finished arch_park_cpu
[wheatfox] cell->loadable = 1
[wheatfox] in out_resume
[wheatfox] in resume_cpu, cpu_id = 1
[wheatfox] in resume_cpu, target_data->cpu_suspended = 1
[  130.579626] [wheatfox] (jailhouse_cmd_cell_load) 
jailhouse_call_arg1(JAILHOUSE_HC_CELL_SET_LOADABLE, cell->id) done
[  130.590182] [wheatfox] (jailhouse_cmd_cell_load) 
cell_load.num_preload_images = 1
[  130.597678] [wheatfox] (jailhouse_cmd_cell_load) load_image(cell, image) 
start, n = 1
[  130.605532] [wheatfox] (load_image) start
[  130.609557] [wheatfox] (load_image) copy_from_user done
[  130.614795] [wheatfox] (load_image) image.size = 1ab7200
[  130.620131] [wheatfox] (load_image) found suitable memory region, 
mem->virt_start = c0000000, mem->size = 3d700000
[  130.630505] [wheatfox] (load_image) image load mem region found
[  130.636699] [wheatfox] (load_image) phys_start = c0280000
[  130.642128] [wheatfox] (load_image) page_offs = 0
[  130.646853] [wheatfox] (load_image) image_mem = 000000007135b443
[  130.652883] [wheatfox] (load_image) copy_from_user params:
[  130.658387] [wheatfox] (load_image) to = 000000007135b443
[  130.663808] [wheatfox] (load_image) from = 00000000ebdde5d4
[  130.669399] [wheatfox] (load_image) n = 1ab7200
[  130.673952] [wheatfox] (load_image) copy_from_user start

then nothing happens after this 'copy_from_user start`, the source code is:
printk("[wheatfox] (load_image) copy_from_user start\n");
if (copy_from_user(image_mem + page_offs,
(void __user *)(unsigned long)image.source_address,
image.size))
err = -EFAULT;
printk("[wheatfox] (load_image) copy_from_user done\n");


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f81eedab-debe-4d19-954a-06b55f2fa4a9n%40googlegroups.com.

------=_Part_88218_51637466.1704702401379
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm using OK8MP board with=C2=A0i.MX8MP CPU. I have already started jailhou=
se with <font face=3D"Courier New">imx8mp.cell</font> configuration, and th=
e example gic-demo works fine. However, when I try to start a linux inmate =
using=C2=A0<font face=3D"Courier New">imx8mp-linux-demo.cell</font>, the ja=
ilhouse's load progress seems stuck.<div><br /></div><div>After adding some=
 debug print in jailhouse's python script, firmware code and kernel module =
code, I found out that the <b>copy_from_user</b> call in <b>load_image</b>=
=C2=A0function (driver/cell.c) doesn't return and halt forever:</div><div><=
br /></div><div>jailhouse commands:</div><div><font face=3D"Courier New">./=
tools/jailhouse enable ./imx8mp.cell<br />./tools/jailhouse cell linux \<br=
 /><span style=3D"white-space: pre;">	</span>./imx8mp-linux-demo.cell \<br =
/><span style=3D"white-space: pre;">	</span>./kernel/Image \<br /><span sty=
le=3D"white-space: pre;">	</span>-i ./kernel/ramdisk.img \<br /><span style=
=3D"white-space: pre;">	</span>-d ./kernel/imx8mp-evk-inmate-wheatfox.dtb \=
<br /><span style=3D"white-space: pre;">	</span>-c "clk_ignore_unused conso=
le=3Dttymxc1,0x30890000,115200 earlycon=3Dec_imx6q,0x30890000,115200"</font=
><br /><div><br /></div><div>start linux cell output(with the string 'wheat=
fox' means it's my custom debug print):</div><div><font face=3D"Courier New=
">root@OK8MP:/mnt# ./start-linux.sh <br />[wheatfox|python] Jailhouse Linux=
 Cell Boot Helper<br />[wheatfox|python] linux_loader=3D/m[ =C2=A0129.96593=
3] [wheatfox] (jailhouse_ioctl) ioctl=3D0x5401 arg=3D281474720244744<br />n=
t/tools/../inmates/tools/arm64/l[ =C2=A0129.975611] [wheatfox] (jailhouse_i=
octl) ioctl=3D0x5401 arg=3D281474720244728<br />inux-loader.bin<br />[ =C2=
=A0129.988033] [wheatfox] (jailhouse_ioctl) ioctl=3D0x40100002 arg=3D281474=
720244800<br />[ =C2=A0129.995192] [wheatfox] (jailhouse_ioctl) JAILHOUSE_C=
ELL_CREATE<br />[ =C2=A0130.001072] [wheatfox] (jailhouse_cmd_cell_create) =
start<br />[ =C2=A0130.006404] [wheatfox] (jailhouse_cmd_cell_create) copy_=
from_user done<br />[ =C2=A0130.012960] [wheatfox] (jailhouse_cmd_cell_crea=
te) copy_from_user done<br />[ =C2=A0130.019507] [wheatfox] (jailhouse_cmd_=
cell_create) cell_id.id =3D -1<br />[ =C2=A0130.095151] IRQ 6: no longer af=
fine to CPU2<br />[ =C2=A0130.095333] CPU2: shutdown<br />[ =C2=A0130.10225=
1] psci: CPU2 killed (polled 0 ms)<br />[ =C2=A0130.155283] CPU3: shutdown<=
br />[ =C2=A0130.157999] psci: CPU3 killed (polled 0 ms)<br />[wheatfox] in=
 hypercall, code =3D 1, arg1 =3D 2955416576, arg2 =3D 2<br />[wheatfox] in =
hypercall, JAILHOUSE_HC_CELL_CREATE<br />Adding virtual PCI device 00:00.0 =
to cell "linux-inmate-demo"<br />Shared memory connection established, peer=
 cells:<br />=C2=A0"imx8mp"<br />Adding virtual PCI device 00:01.0 to cell =
"linux-inmate-demo"<br />Shared memory connection established, peer cells:<=
br />=C2=A0"imx8mp"<br />[wheatfox] in resume_cpu, cpu_id =3D 2<br />[wheat=
fox] in resume_cpu, target_data-&gt;cpu_suspended =3D 1<br />[wheatfox] in =
resume_cpu, cpu_id =3D 3<br />[wheatfox] in resume_cpu, target_data-&gt;cpu=
_suspended =3D 1<br />Created cell "linux-inmate-demo"<br />Page pool usage=
 after cell creation: mem 82/992, remap 144/131072<br />[wheatfox] in resum=
e_cpu, cpu_id =3D 0<br />[wheatfox] in resume_cpu, target_data-&gt;cpu_susp=
ended =3D 1<br />[ =C2=A0130.231800] [wheatfox] (jailhouse_cmd_cell_create)=
 Created cell "linux-inmate-demo"<br />[wheatfox|python] cell created, name=
=3Db'linux-inmate-demo\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\=
x00\x00'<br />[wheatf[ =C2=A0130.249264] [wheatfox] (jailhouse_ioctl) ioctl=
=3D0x40300003 arg=3D281474720245360<br />ox|python] trying to load linux_l[=
 =C2=A0130.257905] [wheatfox] (jailhouse_ioctl) JAILHOUSE_CELL_LOAD<br />oa=
der.bin into cell, addr=3D0x0<br />[ =C2=A0130.266684] [wheatfox] (jailhous=
e_cmd_cell_load) start<br />[ =C2=A0130.274322] [wheatfox] (jailhouse_cmd_c=
ell_load) cell_management_prologue(&amp;cell_load.cell_id, &amp;cell) done<=
br />[wheatfox] in hypercall, code =3D 3, arg1 =3D 1, arg2 =3D 430887177507=
3466112<br />[wheatfox] in hypercall, JAILHOUSE_HC_CELL_SET_LOADABLE<br />[=
wheatfox] in cell_set_loadable, id =3D 1<br />[wheatfox] cell_management_pr=
ologue finished<br />[wheatfox] in resume_cpu, cpu_id =3D 2<br />[wheatfox]=
 in resume_cpu, target_data-&gt;cpu_suspended =3D 1<br />[wheatfox] in resu=
me_cpu, cpu_id =3D 3<br />[wheatfox] in resume_cpu, target_data-&gt;cpu_sus=
pended =3D 1<br />[wheatfox] finished arch_park_cpu<br />[wheatfox] cell-&g=
t;loadable =3D 0<br />[wheatfox] not jumped to out_resume<br />Cell "linux-=
inmate-demo" can be loaded<br />[wheatfox] in out_resume<br />[wheatfox] in=
 resume_cpu, cpu_id =3D 1<br />[wheatfox] in resume_cpu, target_data-&gt;cp=
u_suspended =3D 1<br />[ =C2=A0130.342417] [wheatfox] (jailhouse_cmd_cell_l=
oad) jailhouse_call_arg1(JAILHOUSE_HC_CELL_SET_LOADABLE, cell-&gt;id) done<=
br />[ =C2=A0130.353079] [wheatfox] (jailhouse_cmd_cell_load) cell_load.num=
_preload_images =3D 1<br />[ =C2=A0130.360584] [wheatfox] (jailhouse_cmd_ce=
ll_load) load_image(cell, image) start, n =3D 1<br />[ =C2=A0130.368444] [w=
heatfox] (load_image) start<br />[ =C2=A0130.372468] [wheatfox] (load_image=
) copy_from_user done<br />[ =C2=A0130.377712] [wheatfox] (load_image) imag=
e.size =3D 34b0<br />[ =C2=A0130.382776] [wheatfox] (load_image) found suit=
able memory region, mem-&gt;virt_start =3D 0, mem-&gt;size =3D 10000<br />[=
 =C2=A0130.392280] [wheatfox] (load_image) image load mem region found<br /=
>[ =C2=A0130.398228] [wheatfox] (load_image) phys_start =3D fdb00000<br />[=
 =C2=A0130.403653] [wheatfox] (load_image) page_offs =3D 0<br />[ =C2=A0130=
.408373] [wheatfox] (load_image) image_mem =3D 0000000079dd6ce3<br />[ =C2=
=A0130.414405] [wheatfox] (load_image) copy_from_user params:<br />[ =C2=A0=
130.419905] [wheatfox] (load_image) to =3D 0000000079dd6ce3<br />[ =C2=A013=
0.425329] [wheatfox] (load_image) from =3D 00000000c239ec71<br />[ =C2=A013=
0.430915] [wheatfox] (load_image) n =3D 34b0<br />[ =C2=A0130.435220] [whea=
tfox] (load_image) copy_from_user start<br />[ =C2=A0130.440563] [wheatfox]=
 (load_image) copy_from_user done<br />[ =C2=A0130.445822] [wheatfox] (load=
_image) flush_icache_range done<br />[ =C2=A0130.451429] [wheatfox] (jailho=
use_cmd_cell_load) load_image(cell, image) done, n =3D 1<br />[ =C2=A0130.4=
59186] [wheatfox] (jailhouse_cmd_cell_load) unlock_out done, exiting jailho=
use_cmd_cell_load<br />[wheatfox|python] linux_loader.bin loaded<br />[whea=
tfox|python] trying to load kernel into cell, addr=3D0xc0280000<br />[ =C2=
=A0130.500262] [wheatfox] (jailhouse_ioctl) ioctl=3D0x40300003 arg=3D281474=
720245360<br />[ =C2=A0130.507454] [wheatfox] (jailhouse_ioctl) JAILHOUSE_C=
ELL_LOAD<br />[ =C2=A0130.513165] [wheatfox] (jailhouse_cmd_cell_load) star=
t<br />[ =C2=A0130.518321] [wheatfox] (jailhouse_cmd_cell_load) cell_manage=
ment_prologue(&amp;cell_load.cell_id, &amp;cell) done<br />[wheatfox] in hy=
percall, code =3D 3, arg1 =3D 1, arg2 =3D 4308871775073466112<br />[wheatfo=
x] in hypercall, JAILHOUSE_HC_CELL_SET_LOADABLE<br />[wheatfox] in cell_set=
_loadable, id =3D 1<br />[wheatfox] cell_management_prologue finished<br />=
[wheatfox] in resume_cpu, cpu_id =3D 2<br />[wheatfox] in resume_cpu, targe=
t_data-&gt;cpu_suspended =3D 1<br />[wheatfox] in resume_cpu, cpu_id =3D 3<=
br />[wheatfox] in resume_cpu, target_data-&gt;cpu_suspended =3D 1<br />[wh=
eatfox] finished arch_park_cpu<br />[wheatfox] cell-&gt;loadable =3D 1<br /=
>[wheatfox] in out_resume<br />[wheatfox] in resume_cpu, cpu_id =3D 1<br />=
[wheatfox] in resume_cpu, target_data-&gt;cpu_suspended =3D 1<br />[ =C2=A0=
130.579626] [wheatfox] (jailhouse_cmd_cell_load) jailhouse_call_arg1(JAILHO=
USE_HC_CELL_SET_LOADABLE, cell-&gt;id) done<br />[ =C2=A0130.590182] [wheat=
fox] (jailhouse_cmd_cell_load) cell_load.num_preload_images =3D 1<br />[ =
=C2=A0130.597678] [wheatfox] (jailhouse_cmd_cell_load) load_image(cell, ima=
ge) start, n =3D 1<br />[ =C2=A0130.605532] [wheatfox] (load_image) start<b=
r />[ =C2=A0130.609557] [wheatfox] (load_image) copy_from_user done<br />[ =
=C2=A0130.614795] [wheatfox] (load_image) image.size =3D 1ab7200<br />[ =C2=
=A0130.620131] [wheatfox] (load_image) found suitable memory region, mem-&g=
t;virt_start =3D c0000000, mem-&gt;size =3D 3d700000<br />[ =C2=A0130.63050=
5] [wheatfox] (load_image) image load mem region found<br />[ =C2=A0130.636=
699] [wheatfox] (load_image) phys_start =3D c0280000<br />[ =C2=A0130.64212=
8] [wheatfox] (load_image) page_offs =3D 0<br />[ =C2=A0130.646853] [wheatf=
ox] (load_image) image_mem =3D 000000007135b443<br />[ =C2=A0130.652883] [w=
heatfox] (load_image) copy_from_user params:<br />[ =C2=A0130.658387] [whea=
tfox] (load_image) to =3D 000000007135b443<br />[ =C2=A0130.663808] [wheatf=
ox] (load_image) from =3D 00000000ebdde5d4<br />[ =C2=A0130.669399] [wheatf=
ox] (load_image) n =3D 1ab7200<br />[ =C2=A0130.673952] [wheatfox] (load_im=
age) copy_from_user start<br /></font><br />then nothing happens after this=
 'copy_from_user start`, the source code is:</div><div><font face=3D"Courie=
r New">printk("[wheatfox] (load_image) copy_from_user start\n");<br />if (c=
opy_from_user(image_mem + page_offs,<br /><span style=3D"white-space: pre;"=
>	</span>(void __user *)(unsigned long)image.source_address,<br /><span sty=
le=3D"white-space: pre;">	</span>image.size))<br /><span style=3D"white-spa=
ce: pre;">	</span>err =3D -EFAULT;<br />printk("[wheatfox] (load_image) cop=
y_from_user done\n");</font><br /></div><div><br /></div><div><br /></div><=
/div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/f81eedab-debe-4d19-954a-06b55f2fa4a9n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/f81eedab-debe-4d19-954a-06b55f2fa4a9n%40googlegroups.co=
m</a>.<br />

------=_Part_88218_51637466.1704702401379--

------=_Part_88217_743477884.1704702401378--
