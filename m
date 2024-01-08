Return-Path: <jailhouse-dev+bncBC7Y32GTCIILXZ7OVQDBUBCCOYIE6@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb40.google.com (mail-yb1-xb40.google.com [IPv6:2607:f8b0:4864:20::b40])
	by mail.lfdr.de (Postfix) with ESMTPS id 132B5826992
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Jan 2024 09:35:09 +0100 (CET)
Received: by mail-yb1-xb40.google.com with SMTP id 3f1490d57ef6-dbe02d0c945sf494386276.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Jan 2024 00:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1704702908; x=1705307708; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vSYslMg1m2QI8zZPZYDiGQ/cD1aP2ryPLZayyNbKcNg=;
        b=WYgr8lr2nTP7o5Qw2AhWZ08VjXW7deXmGBJRX5iQINxZyeyY1r8jXdCtJIIHnKfN6E
         yrnAjVlusmfhnKlga+fNP8/FoWSiI2Pm2ctwtt/1aDfqU5eQRrphIFDecfKK5izvrkHW
         kobHO4DgB33yuXylYl6n4GyZ0bkNBcYzasN+lEuFuxnQ2WYyov5ssUzuVXnBegmotrD+
         r9QBdN5z+dnd0sVYmvnS8uKnC0dyoiHxUopOalCyInlQUZBjgxZY5uNBjrvqjA8kJYMO
         Hy0B1JoZLw+RyqtscWZRLBVThw/OmbGX48cNI+ZCapHos2fXfxlunXzFOuTWoMJawa+t
         3ABA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704702908; x=1705307708; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vSYslMg1m2QI8zZPZYDiGQ/cD1aP2ryPLZayyNbKcNg=;
        b=Hrfnx+gKcKdsseSRl5GK/i9JD0P6E3UbVIRye0SdHgklJh2ka6buaH6Ns3S7owlb/4
         AV+LEt5MhPpStfhBNwePtfA26pWETwdEtM1hQVbJXxJ1TxfWzN3KJOsZqiFAh9X7kSdS
         t4bD5EFIG+uqKzmuSmWw4EX9gPhc2XB7c7xWePu4TWW4JRAV2eoEri82MG9pQho9eQn7
         s+xjrJh8aJIiLhD7Zx/laCdHWjST97MXOoqUayyojcYOiD/aNCk8AqHEKUjYBYH+B3c+
         biS09pCLPugbsZ+E+dGKblSRvKgSDzC3ISXAn7/vVe1a3ZleQKjq1EgSnGyBDAYCScWs
         Fggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704702908; x=1705307708;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vSYslMg1m2QI8zZPZYDiGQ/cD1aP2ryPLZayyNbKcNg=;
        b=MaIztUX4lGOsIF9GTWKMrNPAZCoUYojpOcGB6AUV5IsZn6/0pD2nKnNmTT1x+kPIfv
         72u5eP0/RYwsruokHSh+exn6U1uWlY6/qpJ8aOhfXFqHXITNMvTFCQZkMdzZr2sdPlPj
         VoWhckzMzfij/yAZvWbdhXHzFPAszY/kirspkF5ESpuaTGJ32QWf7yRirLhMvwApEo2w
         biT3SftWYyu4Ln2hq6kU9+LtU/g1UZCJa1BAai5pjXV9GvdZigDZdQvK+BJHkZ/tqCyz
         9tsYQdOlDYkC9sVOJ/eCI7eqPKyTvzDHbcBXsKObv5hrOQc3+uCANBZ1zH2vmXNr97wb
         poFg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YzWRSY5+GRWI5PQgU4fj+DiaHpjPHOs4Ln13oZDf9HQIbQSuHjh
	xg5RkERlNrq1sukaUBMvFvs=
X-Google-Smtp-Source: AGHT+IE6c4H5YROgbx6+KdcoadBhdol6MmiorsZlbXQSfivWOYGiqM/OH42JVITpxYAR/oDXxOUhhA==
X-Received: by 2002:a25:8586:0:b0:db5:50ea:d304 with SMTP id x6-20020a258586000000b00db550ead304mr671590ybk.34.1704702907757;
        Mon, 08 Jan 2024 00:35:07 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:e093:0:b0:dbd:4632:de3 with SMTP id x141-20020a25e093000000b00dbd46320de3ls768657ybg.0.-pod-prod-06-us;
 Mon, 08 Jan 2024 00:35:06 -0800 (PST)
X-Received: by 2002:a25:b907:0:b0:db5:4a39:feb8 with SMTP id x7-20020a25b907000000b00db54a39feb8mr1299250ybj.8.1704702906149;
        Mon, 08 Jan 2024 00:35:06 -0800 (PST)
Date: Mon, 8 Jan 2024 00:35:05 -0800 (PST)
From: wheatfox <enkerewpo@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <ff6757cb-6436-4696-a05b-300d44803178n@googlegroups.com>
In-Reply-To: <f81eedab-debe-4d19-954a-06b55f2fa4a9n@googlegroups.com>
References: <f81eedab-debe-4d19-954a-06b55f2fa4a9n@googlegroups.com>
Subject: Re: i.MX8MP jailhouse load image stuck at copy_from_user
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_86051_2053779379.1704702905597"
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

------=_Part_86051_2053779379.1704702905597
Content-Type: multipart/alternative; 
	boundary="----=_Part_86052_1731809908.1704702905597"

------=_Part_86052_1731809908.1704702905597
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

According to jailhouse-cell-linux sciprt, the load of linux_loader.bin is=
=20
successful, but the linux kernel image's load progress stuck at=20
load_image's copy_from_user. Therefore, the script never reaches the 'start=
=20
cell' step and the linux cannot be started due to previous reason. I don't=
=20
know what is causing the copy_from_user kernel function to halt and I=20
really appreciate it if you can help me with this issue! Thanks.

On Monday, January 8, 2024 at 4:26:41=E2=80=AFPM UTC+8 wheatfox wrote:

> I'm using OK8MP board with i.MX8MP CPU. I have already started jailhouse=
=20
> with imx8mp.cell configuration, and the example gic-demo works fine.=20
> However, when I try to start a linux inmate using imx8mp-linux-demo.cell,=
=20
> the jailhouse's load progress seems stuck.
>
> After adding some debug print in jailhouse's python script, firmware code=
=20
> and kernel module code, I found out that the *copy_from_user* call in=20
> *load_image* function (driver/cell.c) doesn't return and halt forever:
>
> jailhouse commands:
> ./tools/jailhouse enable ./imx8mp.cell
> ./tools/jailhouse cell linux \
> ./imx8mp-linux-demo.cell \
> ./kernel/Image \
> -i ./kernel/ramdisk.img \
> -d ./kernel/imx8mp-evk-inmate-wheatfox.dtb \
> -c "clk_ignore_unused console=3Dttymxc1,0x30890000,115200=20
> earlycon=3Dec_imx6q,0x30890000,115200"
>
> start linux cell output(with the string 'wheatfox' means it's my custom=
=20
> debug print):
> root@OK8MP:/mnt# ./start-linux.sh=20
> [wheatfox|python] Jailhouse Linux Cell Boot Helper
> [wheatfox|python] linux_loader=3D/m[  129.965933] [wheatfox]=20
> (jailhouse_ioctl) ioctl=3D0x5401 arg=3D281474720244744
> nt/tools/../inmates/tools/arm64/l[  129.975611] [wheatfox]=20
> (jailhouse_ioctl) ioctl=3D0x5401 arg=3D281474720244728
> inux-loader.bin
> [  129.988033] [wheatfox] (jailhouse_ioctl) ioctl=3D0x40100002=20
> arg=3D281474720244800
> [  129.995192] [wheatfox] (jailhouse_ioctl) JAILHOUSE_CELL_CREATE
> [  130.001072] [wheatfox] (jailhouse_cmd_cell_create) start
> [  130.006404] [wheatfox] (jailhouse_cmd_cell_create) copy_from_user done
> [  130.012960] [wheatfox] (jailhouse_cmd_cell_create) copy_from_user done
> [  130.019507] [wheatfox] (jailhouse_cmd_cell_create) cell_id.id =3D -1
> [  130.095151] IRQ 6: no longer affine to CPU2
> [  130.095333] CPU2: shutdown
> [  130.102251] psci: CPU2 killed (polled 0 ms)
> [  130.155283] CPU3: shutdown
> [  130.157999] psci: CPU3 killed (polled 0 ms)
> [wheatfox] in hypercall, code =3D 1, arg1 =3D 2955416576, arg2 =3D 2
> [wheatfox] in hypercall, JAILHOUSE_HC_CELL_CREATE
> Adding virtual PCI device 00:00.0 to cell "linux-inmate-demo"
> Shared memory connection established, peer cells:
>  "imx8mp"
> Adding virtual PCI device 00:01.0 to cell "linux-inmate-demo"
> Shared memory connection established, peer cells:
>  "imx8mp"
> [wheatfox] in resume_cpu, cpu_id =3D 2
> [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
> [wheatfox] in resume_cpu, cpu_id =3D 3
> [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
> Created cell "linux-inmate-demo"
> Page pool usage after cell creation: mem 82/992, remap 144/131072
> [wheatfox] in resume_cpu, cpu_id =3D 0
> [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
> [  130.231800] [wheatfox] (jailhouse_cmd_cell_create) Created cell=20
> "linux-inmate-demo"
> [wheatfox|python] cell created,=20
> name=3Db'linux-inmate-demo\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x0=
0\x00\x00\x00'
> [wheatf[  130.249264] [wheatfox] (jailhouse_ioctl) ioctl=3D0x40300003=20
> arg=3D281474720245360
> ox|python] trying to load linux_l[  130.257905] [wheatfox]=20
> (jailhouse_ioctl) JAILHOUSE_CELL_LOAD
> oader.bin into cell, addr=3D0x0
> [  130.266684] [wheatfox] (jailhouse_cmd_cell_load) start
> [  130.274322] [wheatfox] (jailhouse_cmd_cell_load)=20
> cell_management_prologue(&cell_load.cell_id, &cell) done
> [wheatfox] in hypercall, code =3D 3, arg1 =3D 1, arg2 =3D 430887177507346=
6112
> [wheatfox] in hypercall, JAILHOUSE_HC_CELL_SET_LOADABLE
> [wheatfox] in cell_set_loadable, id =3D 1
> [wheatfox] cell_management_prologue finished
> [wheatfox] in resume_cpu, cpu_id =3D 2
> [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
> [wheatfox] in resume_cpu, cpu_id =3D 3
> [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
> [wheatfox] finished arch_park_cpu
> [wheatfox] cell->loadable =3D 0
> [wheatfox] not jumped to out_resume
> Cell "linux-inmate-demo" can be loaded
> [wheatfox] in out_resume
> [wheatfox] in resume_cpu, cpu_id =3D 1
> [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
> [  130.342417] [wheatfox] (jailhouse_cmd_cell_load)=20
> jailhouse_call_arg1(JAILHOUSE_HC_CELL_SET_LOADABLE, cell->id) done
> [  130.353079] [wheatfox] (jailhouse_cmd_cell_load)=20
> cell_load.num_preload_images =3D 1
> [  130.360584] [wheatfox] (jailhouse_cmd_cell_load) load_image(cell,=20
> image) start, n =3D 1
> [  130.368444] [wheatfox] (load_image) start
> [  130.372468] [wheatfox] (load_image) copy_from_user done
> [  130.377712] [wheatfox] (load_image) image.size =3D 34b0
> [  130.382776] [wheatfox] (load_image) found suitable memory region,=20
> mem->virt_start =3D 0, mem->size =3D 10000
> [  130.392280] [wheatfox] (load_image) image load mem region found
> [  130.398228] [wheatfox] (load_image) phys_start =3D fdb00000
> [  130.403653] [wheatfox] (load_image) page_offs =3D 0
> [  130.408373] [wheatfox] (load_image) image_mem =3D 0000000079dd6ce3
> [  130.414405] [wheatfox] (load_image) copy_from_user params:
> [  130.419905] [wheatfox] (load_image) to =3D 0000000079dd6ce3
> [  130.425329] [wheatfox] (load_image) from =3D 00000000c239ec71
> [  130.430915] [wheatfox] (load_image) n =3D 34b0
> [  130.435220] [wheatfox] (load_image) copy_from_user start
> [  130.440563] [wheatfox] (load_image) copy_from_user done
> [  130.445822] [wheatfox] (load_image) flush_icache_range done
> [  130.451429] [wheatfox] (jailhouse_cmd_cell_load) load_image(cell,=20
> image) done, n =3D 1
> [  130.459186] [wheatfox] (jailhouse_cmd_cell_load) unlock_out done,=20
> exiting jailhouse_cmd_cell_load
> [wheatfox|python] linux_loader.bin loaded
> [wheatfox|python] trying to load kernel into cell, addr=3D0xc0280000
> [  130.500262] [wheatfox] (jailhouse_ioctl) ioctl=3D0x40300003=20
> arg=3D281474720245360
> [  130.507454] [wheatfox] (jailhouse_ioctl) JAILHOUSE_CELL_LOAD
> [  130.513165] [wheatfox] (jailhouse_cmd_cell_load) start
> [  130.518321] [wheatfox] (jailhouse_cmd_cell_load)=20
> cell_management_prologue(&cell_load.cell_id, &cell) done
> [wheatfox] in hypercall, code =3D 3, arg1 =3D 1, arg2 =3D 430887177507346=
6112
> [wheatfox] in hypercall, JAILHOUSE_HC_CELL_SET_LOADABLE
> [wheatfox] in cell_set_loadable, id =3D 1
> [wheatfox] cell_management_prologue finished
> [wheatfox] in resume_cpu, cpu_id =3D 2
> [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
> [wheatfox] in resume_cpu, cpu_id =3D 3
> [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
> [wheatfox] finished arch_park_cpu
> [wheatfox] cell->loadable =3D 1
> [wheatfox] in out_resume
> [wheatfox] in resume_cpu, cpu_id =3D 1
> [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
> [  130.579626] [wheatfox] (jailhouse_cmd_cell_load)=20
> jailhouse_call_arg1(JAILHOUSE_HC_CELL_SET_LOADABLE, cell->id) done
> [  130.590182] [wheatfox] (jailhouse_cmd_cell_load)=20
> cell_load.num_preload_images =3D 1
> [  130.597678] [wheatfox] (jailhouse_cmd_cell_load) load_image(cell,=20
> image) start, n =3D 1
> [  130.605532] [wheatfox] (load_image) start
> [  130.609557] [wheatfox] (load_image) copy_from_user done
> [  130.614795] [wheatfox] (load_image) image.size =3D 1ab7200
> [  130.620131] [wheatfox] (load_image) found suitable memory region,=20
> mem->virt_start =3D c0000000, mem->size =3D 3d700000
> [  130.630505] [wheatfox] (load_image) image load mem region found
> [  130.636699] [wheatfox] (load_image) phys_start =3D c0280000
> [  130.642128] [wheatfox] (load_image) page_offs =3D 0
> [  130.646853] [wheatfox] (load_image) image_mem =3D 000000007135b443
> [  130.652883] [wheatfox] (load_image) copy_from_user params:
> [  130.658387] [wheatfox] (load_image) to =3D 000000007135b443
> [  130.663808] [wheatfox] (load_image) from =3D 00000000ebdde5d4
> [  130.669399] [wheatfox] (load_image) n =3D 1ab7200
> [  130.673952] [wheatfox] (load_image) copy_from_user start
>
> then nothing happens after this 'copy_from_user start`, the source code i=
s:
> printk("[wheatfox] (load_image) copy_from_user start\n");
> if (copy_from_user(image_mem + page_offs,
> (void __user *)(unsigned long)image.source_address,
> image.size))
> err =3D -EFAULT;
> printk("[wheatfox] (load_image) copy_from_user done\n");
>
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/ff6757cb-6436-4696-a05b-300d44803178n%40googlegroups.com.

------=_Part_86052_1731809908.1704702905597
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

According to=C2=A0<font face=3D"Courier New">jailhouse-cell-linux</font> sc=
iprt, the load of <font face=3D"Courier New">linux_loader.bin</font> is suc=
cessful, but the<font face=3D"Courier New"> linux kernel image</font>'s loa=
d progress stuck at load_image's copy_from_user. Therefore, the script neve=
r reaches the 'start cell' step and the linux cannot be started due to prev=
ious reason. I don't know what is causing the copy_from_user kernel functio=
n to halt and I really appreciate it if you can help me with this issue! Th=
anks.<br /><br /><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmai=
l_attr">On Monday, January 8, 2024 at 4:26:41=E2=80=AFPM UTC+8 wheatfox wro=
te:<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8e=
x; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">I&#39;m u=
sing OK8MP board with=C2=A0i.MX8MP CPU. I have already started jailhouse wi=
th <font face=3D"Courier New">imx8mp.cell</font> configuration, and the exa=
mple gic-demo works fine. However, when I try to start a linux inmate using=
=C2=A0<font face=3D"Courier New">imx8mp-linux-demo.cell</font>, the jailhou=
se&#39;s load progress seems stuck.<div><br></div><div>After adding some de=
bug print in jailhouse&#39;s python script, firmware code and kernel module=
 code, I found out that the <b>copy_from_user</b> call in <b>load_image</b>=
=C2=A0function (driver/cell.c) doesn&#39;t return and halt forever:</div><d=
iv><br></div><div>jailhouse commands:</div><div><font face=3D"Courier New">=
./tools/jailhouse enable ./imx8mp.cell<br>./tools/jailhouse cell linux \<br=
><span style=3D"white-space:pre">	</span>./imx8mp-linux-demo.cell \<br><spa=
n style=3D"white-space:pre">	</span>./kernel/Image \<br><span style=3D"whit=
e-space:pre">	</span>-i ./kernel/ramdisk.img \<br><span style=3D"white-spac=
e:pre">	</span>-d ./kernel/imx8mp-evk-inmate-wheatfox.dtb \<br><span style=
=3D"white-space:pre">	</span>-c &quot;clk_ignore_unused console=3Dttymxc1,0=
x30890000,115200 earlycon=3Dec_imx6q,0x30890000,115200&quot;</font><br><div=
><br></div><div>start linux cell output(with the string &#39;wheatfox&#39; =
means it&#39;s my custom debug print):</div><div><font face=3D"Courier New"=
>root@OK8MP:/mnt# ./start-linux.sh <br>[wheatfox|python] Jailhouse Linux Ce=
ll Boot Helper<br>[wheatfox|python] linux_loader=3D/m[ =C2=A0129.965933] [w=
heatfox] (jailhouse_ioctl) ioctl=3D0x5401 arg=3D281474720244744<br>nt/tools=
/../inmates/tools/arm64/l[ =C2=A0129.975611] [wheatfox] (jailhouse_ioctl) i=
octl=3D0x5401 arg=3D281474720244728<br>inux-loader.bin<br>[ =C2=A0129.98803=
3] [wheatfox] (jailhouse_ioctl) ioctl=3D0x40100002 arg=3D281474720244800<br=
>[ =C2=A0129.995192] [wheatfox] (jailhouse_ioctl) JAILHOUSE_CELL_CREATE<br>=
[ =C2=A0130.001072] [wheatfox] (jailhouse_cmd_cell_create) start<br>[ =C2=
=A0130.006404] [wheatfox] (jailhouse_cmd_cell_create) copy_from_user done<b=
r>[ =C2=A0130.012960] [wheatfox] (jailhouse_cmd_cell_create) copy_from_user=
 done<br>[ =C2=A0130.019507] [wheatfox] (jailhouse_cmd_cell_create) <a href=
=3D"http://cell_id.id" target=3D"_blank" rel=3D"nofollow" data-saferedirect=
url=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttp://cell_id.id&amp;sou=
rce=3Dgmail&amp;ust=3D1704788809671000&amp;usg=3DAOvVaw3TQ5tuugExdlJsFYPeqH=
q5">cell_id.id</a> =3D -1<br>[ =C2=A0130.095151] IRQ 6: no longer affine to=
 CPU2<br>[ =C2=A0130.095333] CPU2: shutdown<br>[ =C2=A0130.102251] psci: CP=
U2 killed (polled 0 ms)<br>[ =C2=A0130.155283] CPU3: shutdown<br>[ =C2=A013=
0.157999] psci: CPU3 killed (polled 0 ms)<br>[wheatfox] in hypercall, code =
=3D 1, arg1 =3D 2955416576, arg2 =3D 2<br>[wheatfox] in hypercall, JAILHOUS=
E_HC_CELL_CREATE<br>Adding virtual PCI device 00:00.0 to cell &quot;linux-i=
nmate-demo&quot;<br>Shared memory connection established, peer cells:<br>=
=C2=A0&quot;imx8mp&quot;<br>Adding virtual PCI device 00:01.0 to cell &quot=
;linux-inmate-demo&quot;<br>Shared memory connection established, peer cell=
s:<br>=C2=A0&quot;imx8mp&quot;<br>[wheatfox] in resume_cpu, cpu_id =3D 2<br=
>[wheatfox] in resume_cpu, target_data-&gt;cpu_suspended =3D 1<br>[wheatfox=
] in resume_cpu, cpu_id =3D 3<br>[wheatfox] in resume_cpu, target_data-&gt;=
cpu_suspended =3D 1<br>Created cell &quot;linux-inmate-demo&quot;<br>Page p=
ool usage after cell creation: mem 82/992, remap 144/131072<br>[wheatfox] i=
n resume_cpu, cpu_id =3D 0<br>[wheatfox] in resume_cpu, target_data-&gt;cpu=
_suspended =3D 1<br>[ =C2=A0130.231800] [wheatfox] (jailhouse_cmd_cell_crea=
te) Created cell &quot;linux-inmate-demo&quot;<br>[wheatfox|python] cell cr=
eated, name=3Db&#39;linux-inmate-demo\x00\x00\x00\x00\x00\x00\x00\x00\x00\x=
00\x00\x00\x00\x00\x00&#39;<br>[wheatf[ =C2=A0130.249264] [wheatfox] (jailh=
ouse_ioctl) ioctl=3D0x40300003 arg=3D281474720245360<br>ox|python] trying t=
o load linux_l[ =C2=A0130.257905] [wheatfox] (jailhouse_ioctl) JAILHOUSE_CE=
LL_LOAD<br>oader.bin into cell, addr=3D0x0<br>[ =C2=A0130.266684] [wheatfox=
] (jailhouse_cmd_cell_load) start<br>[ =C2=A0130.274322] [wheatfox] (jailho=
use_cmd_cell_load) cell_management_prologue(&amp;cell_load.cell_id, &amp;ce=
ll) done<br>[wheatfox] in hypercall, code =3D 3, arg1 =3D 1, arg2 =3D 43088=
71775073466112<br>[wheatfox] in hypercall, JAILHOUSE_HC_CELL_SET_LOADABLE<b=
r>[wheatfox] in cell_set_loadable, id =3D 1<br>[wheatfox] cell_management_p=
rologue finished<br>[wheatfox] in resume_cpu, cpu_id =3D 2<br>[wheatfox] in=
 resume_cpu, target_data-&gt;cpu_suspended =3D 1<br>[wheatfox] in resume_cp=
u, cpu_id =3D 3<br>[wheatfox] in resume_cpu, target_data-&gt;cpu_suspended =
=3D 1<br>[wheatfox] finished arch_park_cpu<br>[wheatfox] cell-&gt;loadable =
=3D 0<br>[wheatfox] not jumped to out_resume<br>Cell &quot;linux-inmate-dem=
o&quot; can be loaded<br>[wheatfox] in out_resume<br>[wheatfox] in resume_c=
pu, cpu_id =3D 1<br>[wheatfox] in resume_cpu, target_data-&gt;cpu_suspended=
 =3D 1<br>[ =C2=A0130.342417] [wheatfox] (jailhouse_cmd_cell_load) jailhous=
e_call_arg1(JAILHOUSE_HC_CELL_SET_LOADABLE, cell-&gt;id) done<br>[ =C2=A013=
0.353079] [wheatfox] (jailhouse_cmd_cell_load) cell_load.num_preload_images=
 =3D 1<br>[ =C2=A0130.360584] [wheatfox] (jailhouse_cmd_cell_load) load_ima=
ge(cell, image) start, n =3D 1<br>[ =C2=A0130.368444] [wheatfox] (load_imag=
e) start<br>[ =C2=A0130.372468] [wheatfox] (load_image) copy_from_user done=
<br>[ =C2=A0130.377712] [wheatfox] (load_image) image.size =3D 34b0<br>[ =
=C2=A0130.382776] [wheatfox] (load_image) found suitable memory region, mem=
-&gt;virt_start =3D 0, mem-&gt;size =3D 10000<br>[ =C2=A0130.392280] [wheat=
fox] (load_image) image load mem region found<br>[ =C2=A0130.398228] [wheat=
fox] (load_image) phys_start =3D fdb00000<br>[ =C2=A0130.403653] [wheatfox]=
 (load_image) page_offs =3D 0<br>[ =C2=A0130.408373] [wheatfox] (load_image=
) image_mem =3D 0000000079dd6ce3<br>[ =C2=A0130.414405] [wheatfox] (load_im=
age) copy_from_user params:<br>[ =C2=A0130.419905] [wheatfox] (load_image) =
to =3D 0000000079dd6ce3<br>[ =C2=A0130.425329] [wheatfox] (load_image) from=
 =3D 00000000c239ec71<br>[ =C2=A0130.430915] [wheatfox] (load_image) n =3D =
34b0<br>[ =C2=A0130.435220] [wheatfox] (load_image) copy_from_user start<br=
>[ =C2=A0130.440563] [wheatfox] (load_image) copy_from_user done<br>[ =C2=
=A0130.445822] [wheatfox] (load_image) flush_icache_range done<br>[ =C2=A01=
30.451429] [wheatfox] (jailhouse_cmd_cell_load) load_image(cell, image) don=
e, n =3D 1<br>[ =C2=A0130.459186] [wheatfox] (jailhouse_cmd_cell_load) unlo=
ck_out done, exiting jailhouse_cmd_cell_load<br>[wheatfox|python] linux_loa=
der.bin loaded<br>[wheatfox|python] trying to load kernel into cell, addr=
=3D0xc0280000<br>[ =C2=A0130.500262] [wheatfox] (jailhouse_ioctl) ioctl=3D0=
x40300003 arg=3D281474720245360<br>[ =C2=A0130.507454] [wheatfox] (jailhous=
e_ioctl) JAILHOUSE_CELL_LOAD<br>[ =C2=A0130.513165] [wheatfox] (jailhouse_c=
md_cell_load) start<br>[ =C2=A0130.518321] [wheatfox] (jailhouse_cmd_cell_l=
oad) cell_management_prologue(&amp;cell_load.cell_id, &amp;cell) done<br>[w=
heatfox] in hypercall, code =3D 3, arg1 =3D 1, arg2 =3D 4308871775073466112=
<br>[wheatfox] in hypercall, JAILHOUSE_HC_CELL_SET_LOADABLE<br>[wheatfox] i=
n cell_set_loadable, id =3D 1<br>[wheatfox] cell_management_prologue finish=
ed<br>[wheatfox] in resume_cpu, cpu_id =3D 2<br>[wheatfox] in resume_cpu, t=
arget_data-&gt;cpu_suspended =3D 1<br>[wheatfox] in resume_cpu, cpu_id =3D =
3<br>[wheatfox] in resume_cpu, target_data-&gt;cpu_suspended =3D 1<br>[whea=
tfox] finished arch_park_cpu<br>[wheatfox] cell-&gt;loadable =3D 1<br>[whea=
tfox] in out_resume<br>[wheatfox] in resume_cpu, cpu_id =3D 1<br>[wheatfox]=
 in resume_cpu, target_data-&gt;cpu_suspended =3D 1<br>[ =C2=A0130.579626] =
[wheatfox] (jailhouse_cmd_cell_load) jailhouse_call_arg1(JAILHOUSE_HC_CELL_=
SET_LOADABLE, cell-&gt;id) done<br>[ =C2=A0130.590182] [wheatfox] (jailhous=
e_cmd_cell_load) cell_load.num_preload_images =3D 1<br>[ =C2=A0130.597678] =
[wheatfox] (jailhouse_cmd_cell_load) load_image(cell, image) start, n =3D 1=
<br>[ =C2=A0130.605532] [wheatfox] (load_image) start<br>[ =C2=A0130.609557=
] [wheatfox] (load_image) copy_from_user done<br>[ =C2=A0130.614795] [wheat=
fox] (load_image) image.size =3D 1ab7200<br>[ =C2=A0130.620131] [wheatfox] =
(load_image) found suitable memory region, mem-&gt;virt_start =3D c0000000,=
 mem-&gt;size =3D 3d700000<br>[ =C2=A0130.630505] [wheatfox] (load_image) i=
mage load mem region found<br>[ =C2=A0130.636699] [wheatfox] (load_image) p=
hys_start =3D c0280000<br>[ =C2=A0130.642128] [wheatfox] (load_image) page_=
offs =3D 0<br>[ =C2=A0130.646853] [wheatfox] (load_image) image_mem =3D 000=
000007135b443<br>[ =C2=A0130.652883] [wheatfox] (load_image) copy_from_user=
 params:<br>[ =C2=A0130.658387] [wheatfox] (load_image) to =3D 000000007135=
b443<br>[ =C2=A0130.663808] [wheatfox] (load_image) from =3D 00000000ebdde5=
d4<br>[ =C2=A0130.669399] [wheatfox] (load_image) n =3D 1ab7200<br>[ =C2=A0=
130.673952] [wheatfox] (load_image) copy_from_user start<br></font><br>then=
 nothing happens after this &#39;copy_from_user start`, the source code is:=
</div><div><font face=3D"Courier New">printk(&quot;[wheatfox] (load_image) =
copy_from_user start\n&quot;);<br>if (copy_from_user(image_mem + page_offs,=
<br><span style=3D"white-space:pre">	</span>(void __user *)(unsigned long)i=
mage.source_address,<br><span style=3D"white-space:pre">	</span>image.size)=
)<br><span style=3D"white-space:pre">	</span>err =3D -EFAULT;<br>printk(&qu=
ot;[wheatfox] (load_image) copy_from_user done\n&quot;);</font><br></div><d=
iv><br></div><div><br></div></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/ff6757cb-6436-4696-a05b-300d44803178n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/ff6757cb-6436-4696-a05b-300d44803178n%40googlegroups.co=
m</a>.<br />

------=_Part_86052_1731809908.1704702905597--

------=_Part_86051_2053779379.1704702905597--
