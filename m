Return-Path: <jailhouse-dev+bncBC7Y32GTCIILF6XUVQDBUBG664ATO@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3f.google.com (mail-yb1-xb3f.google.com [IPv6:2607:f8b0:4864:20::b3f])
	by mail.lfdr.de (Postfix) with ESMTPS id B0116828614
	for <lists+jailhouse-dev@lfdr.de>; Tue,  9 Jan 2024 13:33:56 +0100 (CET)
Received: by mail-yb1-xb3f.google.com with SMTP id 3f1490d57ef6-dbdfb8fed1bsf3421931276.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Jan 2024 04:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1704803635; x=1705408435; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BJQUN/RrsRqD8ozZsDMtZluRTUVTybdFlSMxOwPGuJw=;
        b=bMYSJPE9RSr0Ft2BCv185gwhTYNHxuQFFEyM3ILSNU7UmGlf18EYtdCmkip1evHvWD
         82ywW+yl8NYq2CSX6HVyW8TMMZW5d9+nEuCCH4gnGJqOjWbmY5j+lac5S9BPN1OYvfqo
         fWo75cUtqEdGQ2Nuh5S+mlexCVIdTsyXZJ78MjNqZiMFIMmLwy/OOm+vpetueDyFTNKs
         au3VtXcDM9Kgys7U564hmLZO8ugwND41VT/Fg3UPTx17XshoQiAZNnFhhlOhjbt8kYe4
         cLlCbu4haGDaz4l6PVk8u28g/uN0HU4ZRePPhV/ZFQwtPbmtHpWkQWs4GMr2UYlstIBo
         TBuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704803635; x=1705408435; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BJQUN/RrsRqD8ozZsDMtZluRTUVTybdFlSMxOwPGuJw=;
        b=TPAJY2ciFMxQoushUy3b2yRB59VSdCcd+rTDmrhif+3HQ9xMYZiSv3Fs59qolub7gJ
         BCCm/29vqpIeTgR1elq4WvC/psdLFu0b8FlHsWX+tRlpmV+OoQtLdWwJis9REHP+ILsR
         N4eV3zPNCuCPVpBQYSBPkZBJFl1xcZ2GmwIj47XtTAzE+pGZ/UZvNpjng0brB99aVs9r
         G0cLtAgp0JB3dCwCmvL36K2VeovhSbbk5kEbLllI+n5TQdiZQt6IvNhp702SjvN3ySl1
         uraSaOkDxJC1YB+IXQn9rX2FN+U5zvvLgoJcNWntU7S/RPBlvOaE5eaYIlkBSWdzAfc3
         goxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704803635; x=1705408435;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BJQUN/RrsRqD8ozZsDMtZluRTUVTybdFlSMxOwPGuJw=;
        b=KO8xgp5gCN90W3R/MORAS7tJNw1oUXoQQS0MqGK3R3nZQ0UXMo1veMPv4SYiFIkDU0
         EWhYE7YKHBLftgx1lInDqKosnSzN2g/SyZn+iSdpSxKiXsgDBHzi9fJBeDkshZZ5PemD
         3+ssgCigMxKUdMQaBD3gbsmMdwpX4c/qgPB9aVTiEX9yGcI9cyPWnwQFpE/KbWW55Vxq
         1nchJWDS0gyfGbXmO4iUDJH+y8xb3g+NyXGUbl/IRL+4Jnfp4csfvMP6ThVThWKFatN6
         vNDjnYfz/HSWOKOBOZ5j75tGH30hP7lx+QVtLxrr8SIfraGaeq6PfY35R6AsNrtTHdVW
         0s6A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YyTj6D9r/pjmIoKDviybVo+4qTWPAmkKdNegmHG0vts8/mTXctu
	8b86/Gh6Vay/XGBMwhwMXq0=
X-Google-Smtp-Source: AGHT+IHe4hDprFzdiFk9DwXtr85rRTZWe2M8hcehKvmtMK8a1zEqKJwvC+L2Cu6HxQZ5jAjR82h9ww==
X-Received: by 2002:a5b:9cc:0:b0:dbd:afa2:e9c8 with SMTP id y12-20020a5b09cc000000b00dbdafa2e9c8mr2057176ybq.48.1704803635334;
        Tue, 09 Jan 2024 04:33:55 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:74c1:0:b0:dbd:5b60:bcff with SMTP id p184-20020a2574c1000000b00dbd5b60bcffls33115ybc.2.-pod-prod-06-us;
 Tue, 09 Jan 2024 04:33:54 -0800 (PST)
X-Received: by 2002:a05:690c:3607:b0:5e4:35c2:fd37 with SMTP id ft7-20020a05690c360700b005e435c2fd37mr2875014ywb.6.1704803633795;
        Tue, 09 Jan 2024 04:33:53 -0800 (PST)
Date: Tue, 9 Jan 2024 04:33:53 -0800 (PST)
From: wheatfox <enkerewpo@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <91a64cf9-a3b4-419b-b030-fc3d295e577en@googlegroups.com>
In-Reply-To: <412a6c64-3a4d-4151-9293-05b9881f3418n@googlegroups.com>
References: <f81eedab-debe-4d19-954a-06b55f2fa4a9n@googlegroups.com>
 <f42f3913-11ea-4b78-86cb-ab4fe76db882@oth-regensburg.de>
 <412a6c64-3a4d-4151-9293-05b9881f3418n@googlegroups.com>
Subject: Re: i.MX8MP jailhouse load image stuck at copy_from_user
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_38130_1976212849.1704803633169"
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

------=_Part_38130_1976212849.1704803633169
Content-Type: multipart/alternative; 
	boundary="----=_Part_38131_2072010205.1704803633169"

------=_Part_38131_2072010205.1704803633169
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Here is my current linux inmate cell configuration for my OK8MP=20
board(imx8mp CPU, 2G RAM + 16G eMMC version), I didn't change the imx8mp.c=
=20
for now.
I edited the RAM region as:
/* RAM */ {
/*
 * We could not use 0x80000000 which conflicts with
 * COMM_REGION_BASE
 */
.phys_start =3D 0x60000000,
.virt_start =3D 0x60000000,
.size =3D 0x10000000,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
JAILHOUSE_MEM_LOADABLE,
},
On Tuesday, January 9, 2024 at 8:19:59=E2=80=AFPM UTC+8 wheatfox wrote:

> Thanks for your instruction! I tried to edit the linux inmate cell=20
> configuration file (imx8mp-linux-demo.c) and I finally get the linux inma=
te=20
> to boot, so I think it was mainly a memory region misconfiguration proble=
m.=20
> (However, the boot progress failed due to VFS fatal error, which I will=
=20
> investigate later...)
> The current full output log is attached as attachment.
>
> On Monday, January 8, 2024 at 7:12:46=E2=80=AFPM UTC+8 Ralf Ramsauer wrot=
e:
>
>> Hi,=20
>>
>> On 08/01/2024 09:26, wheatfox wrote:=20
>> > I'm using OK8MP board with i.MX8MP CPU. I have already started=20
>> jailhouse=20
>> > with imx8mp.cell configuration, and the example gic-demo works fine.=
=20
>> > However, when I try to start a linux inmate using=20
>> > imx8mp-linux-demo.cell, the jailhouse's load progress seems stuck.=20
>> >=20
>> > After adding some debug print in jailhouse's python script, firmware=
=20
>> > code and kernel module code, I found out that the *copy_from_user* cal=
l=20
>> > in *load_image* function (driver/cell.c) doesn't return and halt=20
>> forever: >=20
>> > jailhouse commands:=20
>> > ./tools/jailhouse enable ./imx8mp.cell=20
>> > ./tools/jailhouse cell linux \=20
>> > ./imx8mp-linux-demo.cell \=20
>> > ./kernel/Image \=20
>> > -i ./kernel/ramdisk.img \=20
>>
>> For testing, try to not load the ramdisk. The kernel should at least=20
>> boot and crash. If that works, we know that there's something odd with=
=20
>> the ramdisk.=20
>>
>> Second, double and triple check addresses where things get loaded.=20
>> What's in your non-root cell configuration, and where does the=20
>> linux-loader try to load stuff? Does that match?=20
>>
>> Thanks,=20
>> Ralf=20
>>
>> > -d ./kernel/imx8mp-evk-inmate-wheatfox.dtb \=20
>> > -c "clk_ignore_unused console=3Dttymxc1,0x30890000,115200=20
>> > earlycon=3Dec_imx6q,0x30890000,115200"=20
>> >=20
>> > start linux cell output(with the string 'wheatfox' means it's my custo=
m=20
>> > debug print):=20
>> > root@OK8MP:/mnt# ./start-linux.sh=20
>> > [wheatfox|python] Jailhouse Linux Cell Boot Helper=20
>> > [wheatfox|python] linux_loader=3D/m[  129.965933] [wheatfox]=20
>> > (jailhouse_ioctl) ioctl=3D0x5401 arg=3D281474720244744=20
>> > nt/tools/../inmates/tools/arm64/l[  129.975611] [wheatfox]=20
>> > (jailhouse_ioctl) ioctl=3D0x5401 arg=3D281474720244728=20
>> > inux-loader.bin=20
>> > [  129.988033] [wheatfox] (jailhouse_ioctl) ioctl=3D0x40100002=20
>> > arg=3D281474720244800=20
>> > [  129.995192] [wheatfox] (jailhouse_ioctl) JAILHOUSE_CELL_CREATE=20
>> > [  130.001072] [wheatfox] (jailhouse_cmd_cell_create) start=20
>> > [  130.006404] [wheatfox] (jailhouse_cmd_cell_create) copy_from_user=
=20
>> done=20
>> > [  130.012960] [wheatfox] (jailhouse_cmd_cell_create) copy_from_user=
=20
>> done=20
>> > [  130.019507] [wheatfox] (jailhouse_cmd_cell_create) cell_id.id =3D -=
1=20
>> > [  130.095151] IRQ 6: no longer affine to CPU2=20
>> > [  130.095333] CPU2: shutdown=20
>> > [  130.102251] psci: CPU2 killed (polled 0 ms)=20
>> > [  130.155283] CPU3: shutdown=20
>> > [  130.157999] psci: CPU3 killed (polled 0 ms)=20
>> > [wheatfox] in hypercall, code =3D 1, arg1 =3D 2955416576, arg2 =3D 2=
=20
>> > [wheatfox] in hypercall, JAILHOUSE_HC_CELL_CREATE=20
>> > Adding virtual PCI device 00:00.0 to cell "linux-inmate-demo"=20
>> > Shared memory connection established, peer cells:=20
>> >  "imx8mp"=20
>> > Adding virtual PCI device 00:01.0 to cell "linux-inmate-demo"=20
>> > Shared memory connection established, peer cells:=20
>> >  "imx8mp"=20
>> > [wheatfox] in resume_cpu, cpu_id =3D 2=20
>> > [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1=20
>> > [wheatfox] in resume_cpu, cpu_id =3D 3=20
>> > [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1=20
>> > Created cell "linux-inmate-demo"=20
>> > Page pool usage after cell creation: mem 82/992, remap 144/131072=20
>> > [wheatfox] in resume_cpu, cpu_id =3D 0=20
>> > [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1=20
>> > [  130.231800] [wheatfox] (jailhouse_cmd_cell_create) Created cell=20
>> > "linux-inmate-demo"=20
>> > [wheatfox|python] cell created,=20
>> >=20
>> name=3Db'linux-inmate-demo\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x=
00\x00\x00\x00'=20
>>
>> > [wheatf[  130.249264] [wheatfox] (jailhouse_ioctl) ioctl=3D0x40300003=
=20
>> > arg=3D281474720245360=20
>> > ox|python] trying to load linux_l[  130.257905] [wheatfox]=20
>> > (jailhouse_ioctl) JAILHOUSE_CELL_LOAD=20
>> > oader.bin into cell, addr=3D0x0=20
>> > [  130.266684] [wheatfox] (jailhouse_cmd_cell_load) start=20
>> > [  130.274322] [wheatfox] (jailhouse_cmd_cell_load)=20
>> > cell_management_prologue(&cell_load.cell_id, &cell) done=20
>> > [wheatfox] in hypercall, code =3D 3, arg1 =3D 1, arg2 =3D 430887177507=
3466112=20
>> > [wheatfox] in hypercall, JAILHOUSE_HC_CELL_SET_LOADABLE=20
>> > [wheatfox] in cell_set_loadable, id =3D 1=20
>> > [wheatfox] cell_management_prologue finished=20
>> > [wheatfox] in resume_cpu, cpu_id =3D 2=20
>> > [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1=20
>> > [wheatfox] in resume_cpu, cpu_id =3D 3=20
>> > [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1=20
>> > [wheatfox] finished arch_park_cpu=20
>> > [wheatfox] cell->loadable =3D 0=20
>> > [wheatfox] not jumped to out_resume=20
>> > Cell "linux-inmate-demo" can be loaded=20
>> > [wheatfox] in out_resume=20
>> > [wheatfox] in resume_cpu, cpu_id =3D 1=20
>> > [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1=20
>> > [  130.342417] [wheatfox] (jailhouse_cmd_cell_load)=20
>> > jailhouse_call_arg1(JAILHOUSE_HC_CELL_SET_LOADABLE, cell->id) done=20
>> > [  130.353079] [wheatfox] (jailhouse_cmd_cell_load)=20
>> > cell_load.num_preload_images =3D 1=20
>> > [  130.360584] [wheatfox] (jailhouse_cmd_cell_load) load_image(cell,=
=20
>> > image) start, n =3D 1=20
>> > [  130.368444] [wheatfox] (load_image) start=20
>> > [  130.372468] [wheatfox] (load_image) copy_from_user done=20
>> > [  130.377712] [wheatfox] (load_image) image.size =3D 34b0=20
>> > [  130.382776] [wheatfox] (load_image) found suitable memory region,=
=20
>> > mem->virt_start =3D 0, mem->size =3D 10000=20
>> > [  130.392280] [wheatfox] (load_image) image load mem region found=20
>> > [  130.398228] [wheatfox] (load_image) phys_start =3D fdb00000=20
>> > [  130.403653] [wheatfox] (load_image) page_offs =3D 0=20
>> > [  130.408373] [wheatfox] (load_image) image_mem =3D 0000000079dd6ce3=
=20
>> > [  130.414405] [wheatfox] (load_image) copy_from_user params:=20
>> > [  130.419905] [wheatfox] (load_image) to =3D 0000000079dd6ce3=20
>> > [  130.425329] [wheatfox] (load_image) from =3D 00000000c239ec71=20
>> > [  130.430915] [wheatfox] (load_image) n =3D 34b0=20
>> > [  130.435220] [wheatfox] (load_image) copy_from_user start=20
>> > [  130.440563] [wheatfox] (load_image) copy_from_user done=20
>> > [  130.445822] [wheatfox] (load_image) flush_icache_range done=20
>> > [  130.451429] [wheatfox] (jailhouse_cmd_cell_load) load_image(cell,=
=20
>> > image) done, n =3D 1=20
>> > [  130.459186] [wheatfox] (jailhouse_cmd_cell_load) unlock_out done,=
=20
>> > exiting jailhouse_cmd_cell_load=20
>> > [wheatfox|python] linux_loader.bin loaded=20
>> > [wheatfox|python] trying to load kernel into cell, addr=3D0xc0280000=
=20
>> > [  130.500262] [wheatfox] (jailhouse_ioctl) ioctl=3D0x40300003=20
>> > arg=3D281474720245360=20
>> > [  130.507454] [wheatfox] (jailhouse_ioctl) JAILHOUSE_CELL_LOAD=20
>> > [  130.513165] [wheatfox] (jailhouse_cmd_cell_load) start=20
>> > [  130.518321] [wheatfox] (jailhouse_cmd_cell_load)=20
>> > cell_management_prologue(&cell_load.cell_id, &cell) done=20
>> > [wheatfox] in hypercall, code =3D 3, arg1 =3D 1, arg2 =3D 430887177507=
3466112=20
>> > [wheatfox] in hypercall, JAILHOUSE_HC_CELL_SET_LOADABLE=20
>> > [wheatfox] in cell_set_loadable, id =3D 1=20
>> > [wheatfox] cell_management_prologue finished=20
>> > [wheatfox] in resume_cpu, cpu_id =3D 2=20
>> > [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1=20
>> > [wheatfox] in resume_cpu, cpu_id =3D 3=20
>> > [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1=20
>> > [wheatfox] finished arch_park_cpu=20
>> > [wheatfox] cell->loadable =3D 1=20
>> > [wheatfox] in out_resume=20
>> > [wheatfox] in resume_cpu, cpu_id =3D 1=20
>> > [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1=20
>> > [  130.579626] [wheatfox] (jailhouse_cmd_cell_load)=20
>> > jailhouse_call_arg1(JAILHOUSE_HC_CELL_SET_LOADABLE, cell->id) done=20
>> > [  130.590182] [wheatfox] (jailhouse_cmd_cell_load)=20
>> > cell_load.num_preload_images =3D 1=20
>> > [  130.597678] [wheatfox] (jailhouse_cmd_cell_load) load_image(cell,=
=20
>> > image) start, n =3D 1=20
>> > [  130.605532] [wheatfox] (load_image) start=20
>> > [  130.609557] [wheatfox] (load_image) copy_from_user done=20
>> > [  130.614795] [wheatfox] (load_image) image.size =3D 1ab7200=20
>> > [  130.620131] [wheatfox] (load_image) found suitable memory region,=
=20
>> > mem->virt_start =3D c0000000, mem->size =3D 3d700000=20
>> > [  130.630505] [wheatfox] (load_image) image load mem region found=20
>> > [  130.636699] [wheatfox] (load_image) phys_start =3D c0280000=20
>> > [  130.642128] [wheatfox] (load_image) page_offs =3D 0=20
>> > [  130.646853] [wheatfox] (load_image) image_mem =3D 000000007135b443=
=20
>> > [  130.652883] [wheatfox] (load_image) copy_from_user params:=20
>> > [  130.658387] [wheatfox] (load_image) to =3D 000000007135b443=20
>> > [  130.663808] [wheatfox] (load_image) from =3D 00000000ebdde5d4=20
>> > [  130.669399] [wheatfox] (load_image) n =3D 1ab7200=20
>> > [  130.673952] [wheatfox] (load_image) copy_from_user start=20
>> >=20
>> > then nothing happens after this 'copy_from_user start`, the source cod=
e=20
>> is:=20
>> > printk("[wheatfox] (load_image) copy_from_user start\n");=20
>> > if (copy_from_user(image_mem + page_offs,=20
>> > (void __user *)(unsigned long)image.source_address,=20
>> > image.size))=20
>> > err =3D -EFAULT;=20
>> > printk("[wheatfox] (load_image) copy_from_user done\n");=20
>> >=20
>> >=20
>> > --=20
>> > You received this message because you are subscribed to the Google=20
>> > Groups "Jailhouse" group.=20
>> > To unsubscribe from this group and stop receiving emails from it, send=
=20
>> > an email to jailhouse-de...@googlegroups.com=20
>> > <mailto:jailhouse-de...@googlegroups.com>.=20
>> > To view this discussion on the web visit=20
>> >=20
>> https://groups.google.com/d/msgid/jailhouse-dev/f81eedab-debe-4d19-954a-=
06b55f2fa4a9n%40googlegroups.com=20
>> <
>> https://groups.google.com/d/msgid/jailhouse-dev/f81eedab-debe-4d19-954a-=
06b55f2fa4a9n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.=
=20
>>
>>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/91a64cf9-a3b4-419b-b030-fc3d295e577en%40googlegroups.com.

------=_Part_38131_2072010205.1704803633169
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Here is my current linux inmate cell configuration for my OK8MP board(imx8m=
p CPU, 2G RAM + 16G eMMC version), I didn't change the imx8mp.c for now.<br=
 />I edited the RAM region as:<div><font face=3D"Courier New">/* RAM */ {<b=
r /><span style=3D"white-space: pre;">	</span>/*<br /><span style=3D"white-=
space: pre;">	</span>=C2=A0* We could not use 0x80000000 which conflicts wi=
th<br /><span style=3D"white-space: pre;">	</span>=C2=A0* COMM_REGION_BASE<=
br /><span style=3D"white-space: pre;">	</span>=C2=A0*/<br /><span style=3D=
"white-space: pre;">	</span>.phys_start =3D 0x60000000,<br /><span style=3D=
"white-space: pre;">	</span>.virt_start =3D 0x60000000,<br /><span style=3D=
"white-space: pre;">	</span>.size =3D 0x10000000,<br /><span style=3D"white=
-space: pre;">	</span>.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |=
<br /><span style=3D"white-space: pre;">		</span>JAILHOUSE_MEM_EXECUTE | JA=
ILHOUSE_MEM_DMA |<br /><span style=3D"white-space: pre;">		</span>JAILHOUSE=
_MEM_LOADABLE,<br />},</font><br /></div><div class=3D"gmail_quote"><div di=
r=3D"auto" class=3D"gmail_attr">On Tuesday, January 9, 2024 at 8:19:59=E2=
=80=AFPM UTC+8 wheatfox wrote:<br/></div><blockquote class=3D"gmail_quote" =
style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); pa=
dding-left: 1ex;">Thanks for your instruction! I tried to edit the linux in=
mate cell configuration file (imx8mp-linux-demo.c) and I finally get the li=
nux inmate to boot, so I think it was mainly a memory region misconfigurati=
on problem. (However, the boot progress failed due to VFS fatal error, whic=
h I will investigate later...)<div>The current full output log is attached =
as attachment.<br><br></div><div class=3D"gmail_quote"><div dir=3D"auto" cl=
ass=3D"gmail_attr">On Monday, January 8, 2024 at 7:12:46=E2=80=AFPM UTC+8 R=
alf Ramsauer wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi=
,
<br>
<br>On 08/01/2024 09:26, wheatfox wrote:
<br>&gt; I&#39;m using OK8MP board with=C2=A0i.MX8MP CPU. I have already st=
arted jailhouse=20
<br>&gt; with imx8mp.cell configuration, and the example gic-demo works fin=
e.=20
<br>&gt; However, when I try to start a linux inmate using=20
<br>&gt; imx8mp-linux-demo.cell, the jailhouse&#39;s load progress seems st=
uck.
<br>&gt;=20
<br>&gt; After adding some debug print in jailhouse&#39;s python script, fi=
rmware=20
<br>&gt; code and kernel module code, I found out that the *copy_from_user*=
 call=20
<br>&gt; in *load_image*=C2=A0function (driver/cell.c) doesn&#39;t return a=
nd halt forever: &gt;
<br>&gt; jailhouse commands:
<br>&gt; ./tools/jailhouse enable ./imx8mp.cell
<br>&gt; ./tools/jailhouse cell linux \
<br>&gt; ./imx8mp-linux-demo.cell \
<br>&gt; ./kernel/Image \
<br>&gt; -i ./kernel/ramdisk.img \
<br>
<br>For testing, try to not load the ramdisk. The kernel should at least=20
<br>boot and crash. If that works, we know that there&#39;s something odd w=
ith=20
<br>the ramdisk.
<br>
<br>Second, double and triple check addresses where things get loaded.=20
<br>What&#39;s in your non-root cell configuration, and where does the=20
<br>linux-loader try to load stuff? Does that match?
<br>
<br>Thanks,
<br>   Ralf
<br>
<br>&gt; -d ./kernel/imx8mp-evk-inmate-wheatfox.dtb \
<br>&gt; -c &quot;clk_ignore_unused console=3Dttymxc1,0x30890000,115200=20
<br>&gt; earlycon=3Dec_imx6q,0x30890000,115200&quot;
<br>&gt;=20
<br>&gt; start linux cell output(with the string &#39;wheatfox&#39; means i=
t&#39;s my custom=20
<br>&gt; debug print):
<br>&gt; root@OK8MP:/mnt# ./start-linux.sh
<br>&gt; [wheatfox|python] Jailhouse Linux Cell Boot Helper
<br>&gt; [wheatfox|python] linux_loader=3D/m[ =C2=A0129.965933] [wheatfox]=
=20
<br>&gt; (jailhouse_ioctl) ioctl=3D0x5401 arg=3D281474720244744
<br>&gt; nt/tools/../inmates/tools/arm64/l[ =C2=A0129.975611] [wheatfox]=20
<br>&gt; (jailhouse_ioctl) ioctl=3D0x5401 arg=3D281474720244728
<br>&gt; inux-loader.bin
<br>&gt; [ =C2=A0129.988033] [wheatfox] (jailhouse_ioctl) ioctl=3D0x4010000=
2=20
<br>&gt; arg=3D281474720244800
<br>&gt; [ =C2=A0129.995192] [wheatfox] (jailhouse_ioctl) JAILHOUSE_CELL_CR=
EATE
<br>&gt; [ =C2=A0130.001072] [wheatfox] (jailhouse_cmd_cell_create) start
<br>&gt; [ =C2=A0130.006404] [wheatfox] (jailhouse_cmd_cell_create) copy_fr=
om_user done
<br>&gt; [ =C2=A0130.012960] [wheatfox] (jailhouse_cmd_cell_create) copy_fr=
om_user done
<br>&gt; [ =C2=A0130.019507] [wheatfox] (jailhouse_cmd_cell_create) <a href=
=3D"http://cell_id.id" rel=3D"nofollow" target=3D"_blank" data-saferedirect=
url=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttp://cell_id.id&amp;sou=
rce=3Dgmail&amp;ust=3D1704889679732000&amp;usg=3DAOvVaw1ghYbejN-mmjipTxAQiS=
PM">cell_id.id</a> =3D -1
<br>&gt; [ =C2=A0130.095151] IRQ 6: no longer affine to CPU2
<br>&gt; [ =C2=A0130.095333] CPU2: shutdown
<br>&gt; [ =C2=A0130.102251] psci: CPU2 killed (polled 0 ms)
<br>&gt; [ =C2=A0130.155283] CPU3: shutdown
<br>&gt; [ =C2=A0130.157999] psci: CPU3 killed (polled 0 ms)
<br>&gt; [wheatfox] in hypercall, code =3D 1, arg1 =3D 2955416576, arg2 =3D=
 2
<br>&gt; [wheatfox] in hypercall, JAILHOUSE_HC_CELL_CREATE
<br>&gt; Adding virtual PCI device 00:00.0 to cell &quot;linux-inmate-demo&=
quot;
<br>&gt; Shared memory connection established, peer cells:
<br>&gt;  =C2=A0&quot;imx8mp&quot;
<br>&gt; Adding virtual PCI device 00:01.0 to cell &quot;linux-inmate-demo&=
quot;
<br>&gt; Shared memory connection established, peer cells:
<br>&gt;  =C2=A0&quot;imx8mp&quot;
<br>&gt; [wheatfox] in resume_cpu, cpu_id =3D 2
<br>&gt; [wheatfox] in resume_cpu, target_data-&gt;cpu_suspended =3D 1
<br>&gt; [wheatfox] in resume_cpu, cpu_id =3D 3
<br>&gt; [wheatfox] in resume_cpu, target_data-&gt;cpu_suspended =3D 1
<br>&gt; Created cell &quot;linux-inmate-demo&quot;
<br>&gt; Page pool usage after cell creation: mem 82/992, remap 144/131072
<br>&gt; [wheatfox] in resume_cpu, cpu_id =3D 0
<br>&gt; [wheatfox] in resume_cpu, target_data-&gt;cpu_suspended =3D 1
<br>&gt; [ =C2=A0130.231800] [wheatfox] (jailhouse_cmd_cell_create) Created=
 cell=20
<br>&gt; &quot;linux-inmate-demo&quot;
<br>&gt; [wheatfox|python] cell created,=20
<br>&gt; name=3Db&#39;linux-inmate-demo\x00\x00\x00\x00\x00\x00\x00\x00\x00=
\x00\x00\x00\x00\x00\x00&#39;
<br>&gt; [wheatf[ =C2=A0130.249264] [wheatfox] (jailhouse_ioctl) ioctl=3D0x=
40300003=20
<br>&gt; arg=3D281474720245360
<br>&gt; ox|python] trying to load linux_l[ =C2=A0130.257905] [wheatfox]=20
<br>&gt; (jailhouse_ioctl) JAILHOUSE_CELL_LOAD
<br>&gt; oader.bin into cell, addr=3D0x0
<br>&gt; [ =C2=A0130.266684] [wheatfox] (jailhouse_cmd_cell_load) start
<br>&gt; [ =C2=A0130.274322] [wheatfox] (jailhouse_cmd_cell_load)=20
<br>&gt; cell_management_prologue(&amp;cell_load.cell_id, &amp;cell) done
<br>&gt; [wheatfox] in hypercall, code =3D 3, arg1 =3D 1, arg2 =3D 43088717=
75073466112
<br>&gt; [wheatfox] in hypercall, JAILHOUSE_HC_CELL_SET_LOADABLE
<br>&gt; [wheatfox] in cell_set_loadable, id =3D 1
<br>&gt; [wheatfox] cell_management_prologue finished
<br>&gt; [wheatfox] in resume_cpu, cpu_id =3D 2
<br>&gt; [wheatfox] in resume_cpu, target_data-&gt;cpu_suspended =3D 1
<br>&gt; [wheatfox] in resume_cpu, cpu_id =3D 3
<br>&gt; [wheatfox] in resume_cpu, target_data-&gt;cpu_suspended =3D 1
<br>&gt; [wheatfox] finished arch_park_cpu
<br>&gt; [wheatfox] cell-&gt;loadable =3D 0
<br>&gt; [wheatfox] not jumped to out_resume
<br>&gt; Cell &quot;linux-inmate-demo&quot; can be loaded
<br>&gt; [wheatfox] in out_resume
<br>&gt; [wheatfox] in resume_cpu, cpu_id =3D 1
<br>&gt; [wheatfox] in resume_cpu, target_data-&gt;cpu_suspended =3D 1
<br>&gt; [ =C2=A0130.342417] [wheatfox] (jailhouse_cmd_cell_load)=20
<br>&gt; jailhouse_call_arg1(JAILHOUSE_HC_CELL_SET_LOADABLE, cell-&gt;id) d=
one
<br>&gt; [ =C2=A0130.353079] [wheatfox] (jailhouse_cmd_cell_load)=20
<br>&gt; cell_load.num_preload_images =3D 1
<br>&gt; [ =C2=A0130.360584] [wheatfox] (jailhouse_cmd_cell_load) load_imag=
e(cell,=20
<br>&gt; image) start, n =3D 1
<br>&gt; [ =C2=A0130.368444] [wheatfox] (load_image) start
<br>&gt; [ =C2=A0130.372468] [wheatfox] (load_image) copy_from_user done
<br>&gt; [ =C2=A0130.377712] [wheatfox] (load_image) image.size =3D 34b0
<br>&gt; [ =C2=A0130.382776] [wheatfox] (load_image) found suitable memory =
region,=20
<br>&gt; mem-&gt;virt_start =3D 0, mem-&gt;size =3D 10000
<br>&gt; [ =C2=A0130.392280] [wheatfox] (load_image) image load mem region =
found
<br>&gt; [ =C2=A0130.398228] [wheatfox] (load_image) phys_start =3D fdb0000=
0
<br>&gt; [ =C2=A0130.403653] [wheatfox] (load_image) page_offs =3D 0
<br>&gt; [ =C2=A0130.408373] [wheatfox] (load_image) image_mem =3D 00000000=
79dd6ce3
<br>&gt; [ =C2=A0130.414405] [wheatfox] (load_image) copy_from_user params:
<br>&gt; [ =C2=A0130.419905] [wheatfox] (load_image) to =3D 0000000079dd6ce=
3
<br>&gt; [ =C2=A0130.425329] [wheatfox] (load_image) from =3D 00000000c239e=
c71
<br>&gt; [ =C2=A0130.430915] [wheatfox] (load_image) n =3D 34b0
<br>&gt; [ =C2=A0130.435220] [wheatfox] (load_image) copy_from_user start
<br>&gt; [ =C2=A0130.440563] [wheatfox] (load_image) copy_from_user done
<br>&gt; [ =C2=A0130.445822] [wheatfox] (load_image) flush_icache_range don=
e
<br>&gt; [ =C2=A0130.451429] [wheatfox] (jailhouse_cmd_cell_load) load_imag=
e(cell,=20
<br>&gt; image) done, n =3D 1
<br>&gt; [ =C2=A0130.459186] [wheatfox] (jailhouse_cmd_cell_load) unlock_ou=
t done,=20
<br>&gt; exiting jailhouse_cmd_cell_load
<br>&gt; [wheatfox|python] linux_loader.bin loaded
<br>&gt; [wheatfox|python] trying to load kernel into cell, addr=3D0xc02800=
00
<br>&gt; [ =C2=A0130.500262] [wheatfox] (jailhouse_ioctl) ioctl=3D0x4030000=
3=20
<br>&gt; arg=3D281474720245360
<br>&gt; [ =C2=A0130.507454] [wheatfox] (jailhouse_ioctl) JAILHOUSE_CELL_LO=
AD
<br>&gt; [ =C2=A0130.513165] [wheatfox] (jailhouse_cmd_cell_load) start
<br>&gt; [ =C2=A0130.518321] [wheatfox] (jailhouse_cmd_cell_load)=20
<br>&gt; cell_management_prologue(&amp;cell_load.cell_id, &amp;cell) done
<br>&gt; [wheatfox] in hypercall, code =3D 3, arg1 =3D 1, arg2 =3D 43088717=
75073466112
<br>&gt; [wheatfox] in hypercall, JAILHOUSE_HC_CELL_SET_LOADABLE
<br>&gt; [wheatfox] in cell_set_loadable, id =3D 1
<br>&gt; [wheatfox] cell_management_prologue finished
<br>&gt; [wheatfox] in resume_cpu, cpu_id =3D 2
<br>&gt; [wheatfox] in resume_cpu, target_data-&gt;cpu_suspended =3D 1
<br>&gt; [wheatfox] in resume_cpu, cpu_id =3D 3
<br>&gt; [wheatfox] in resume_cpu, target_data-&gt;cpu_suspended =3D 1
<br>&gt; [wheatfox] finished arch_park_cpu
<br>&gt; [wheatfox] cell-&gt;loadable =3D 1
<br>&gt; [wheatfox] in out_resume
<br>&gt; [wheatfox] in resume_cpu, cpu_id =3D 1
<br>&gt; [wheatfox] in resume_cpu, target_data-&gt;cpu_suspended =3D 1
<br>&gt; [ =C2=A0130.579626] [wheatfox] (jailhouse_cmd_cell_load)=20
<br>&gt; jailhouse_call_arg1(JAILHOUSE_HC_CELL_SET_LOADABLE, cell-&gt;id) d=
one
<br>&gt; [ =C2=A0130.590182] [wheatfox] (jailhouse_cmd_cell_load)=20
<br>&gt; cell_load.num_preload_images =3D 1
<br>&gt; [ =C2=A0130.597678] [wheatfox] (jailhouse_cmd_cell_load) load_imag=
e(cell,=20
<br>&gt; image) start, n =3D 1
<br>&gt; [ =C2=A0130.605532] [wheatfox] (load_image) start
<br>&gt; [ =C2=A0130.609557] [wheatfox] (load_image) copy_from_user done
<br>&gt; [ =C2=A0130.614795] [wheatfox] (load_image) image.size =3D 1ab7200
<br>&gt; [ =C2=A0130.620131] [wheatfox] (load_image) found suitable memory =
region,=20
<br>&gt; mem-&gt;virt_start =3D c0000000, mem-&gt;size =3D 3d700000
<br>&gt; [ =C2=A0130.630505] [wheatfox] (load_image) image load mem region =
found
<br>&gt; [ =C2=A0130.636699] [wheatfox] (load_image) phys_start =3D c028000=
0
<br>&gt; [ =C2=A0130.642128] [wheatfox] (load_image) page_offs =3D 0
<br>&gt; [ =C2=A0130.646853] [wheatfox] (load_image) image_mem =3D 00000000=
7135b443
<br>&gt; [ =C2=A0130.652883] [wheatfox] (load_image) copy_from_user params:
<br>&gt; [ =C2=A0130.658387] [wheatfox] (load_image) to =3D 000000007135b44=
3
<br>&gt; [ =C2=A0130.663808] [wheatfox] (load_image) from =3D 00000000ebdde=
5d4
<br>&gt; [ =C2=A0130.669399] [wheatfox] (load_image) n =3D 1ab7200
<br>&gt; [ =C2=A0130.673952] [wheatfox] (load_image) copy_from_user start
<br>&gt;=20
<br>&gt; then nothing happens after this &#39;copy_from_user start`, the so=
urce code is:
<br>&gt; printk(&quot;[wheatfox] (load_image) copy_from_user start\n&quot;)=
;
<br>&gt; if (copy_from_user(image_mem + page_offs,
<br>&gt; (void __user *)(unsigned long)image.source_address,
<br>&gt; image.size))
<br>&gt; err =3D -EFAULT;
<br>&gt; printk(&quot;[wheatfox] (load_image) copy_from_user done\n&quot;);
<br>&gt;=20
<br>&gt;=20
<br>&gt; --=20
<br>&gt; You received this message because you are subscribed to the Google=
=20
<br>&gt; Groups &quot;Jailhouse&quot; group.
<br>&gt; To unsubscribe from this group and stop receiving emails from it, =
send=20
<br>&gt; an email to <a rel=3D"nofollow">jailhouse-de...@googlegroups.com</=
a>=20
<br>&gt; &lt;mailto:<a rel=3D"nofollow">jailhouse-de...@googlegroups.com</a=
>&gt;.
<br>&gt; To view this discussion on the web visit=20
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/f81eeda=
b-debe-4d19-954a-06b55f2fa4a9n%40googlegroups.com" rel=3D"nofollow" target=
=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;=
q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/f81eedab-debe-4d19-954a=
-06b55f2fa4a9n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1704889679=
732000&amp;usg=3DAOvVaw3kjm7wl0gJLiW8Ayra_G2Z">https://groups.google.com/d/=
msgid/jailhouse-dev/f81eedab-debe-4d19-954a-06b55f2fa4a9n%40googlegroups.co=
m</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/f81eed=
ab-debe-4d19-954a-06b55f2fa4a9n%40googlegroups.com?utm_medium=3Demail&amp;u=
tm_source=3Dfooter" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://groups.google.com/d/=
msgid/jailhouse-dev/f81eedab-debe-4d19-954a-06b55f2fa4a9n%2540googlegroups.=
com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1=
704889679732000&amp;usg=3DAOvVaw3LtcpqmKAdRvt4xgkUcoyQ">https://groups.goog=
le.com/d/msgid/jailhouse-dev/f81eedab-debe-4d19-954a-06b55f2fa4a9n%40google=
groups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt;.
<br></blockquote></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/91a64cf9-a3b4-419b-b030-fc3d295e577en%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/91a64cf9-a3b4-419b-b030-fc3d295e577en%40googlegroups.co=
m</a>.<br />

------=_Part_38131_2072010205.1704803633169--

------=_Part_38130_1976212849.1704803633169
Content-Type: text/x-csrc; charset=US-ASCII; 
	name=imx8mp-linux-demo-wheatfox.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=imx8mp-linux-demo-wheatfox.c
X-Attachment-Id: a06c590f-3d41-4d22-bb2e-e0df7f297f24
Content-ID: <a06c590f-3d41-4d22-bb2e-e0df7f297f24>

/*
 * iMX8MM target - linux-demo
 *
 * Copyright 2019 NXP
 *
 * Authors:
 *  Peng Fan <peng.fan@nxp.com>
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 */

/*
 * Boot 2nd Linux cmdline:
 * export PATH=$PATH:/usr/share/jailhouse/tools/
 * jailhouse cell linux imx8mp-linux-demo.cell Image -d imx8mp-evk-inmate.dtb -c "clk_ignore_unused console=ttymxc3,115200 earlycon=ec_imx6q,0x30890000,115200  root=/dev/mmcblk2p2 rootwait rw"
 */
#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
	struct jailhouse_cell_desc cell;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[15];
	struct jailhouse_irqchip irqchips[2];
	struct jailhouse_pci_device pci_devices[2];
} __attribute__((packed)) config = {
	.cell = {
		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.name = "linux-inmate-demo",
		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,

		.cpu_set_size = sizeof(config.cpus),
		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
		.num_irqchips = ARRAY_SIZE(config.irqchips),
		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
		.vpci_irq_base = 154, /* Not include 32 base */
	},

	.cpus = {
		0xc,
	},

	.mem_regions = {
		/* IVHSMEM shared memory region for 00:00.0 (demo )*/ {
			.phys_start = 0xfd900000,
			.virt_start = 0xfd900000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0xfd901000,
			.virt_start = 0xfd901000,
			.size = 0x9000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0xfd90a000,
			.virt_start = 0xfd90a000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0xfd90c000,
			.virt_start = 0xfd90c000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0xfd90e000,
			.virt_start = 0xfd90e000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_ROOTSHARED,
		},
		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
		JAILHOUSE_SHMEM_NET_REGIONS(0xfda00000, 1),
		/* UART2 earlycon */ {
			.phys_start = 0x30890000,
			.virt_start = 0x30890000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
		},
		/* UART4 */ {
			.phys_start = 0x30a60000,
			.virt_start = 0x30a60000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* SHDC3 */ {
			.phys_start = 0x30b60000,
			.virt_start = 0x30b60000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* RAM: Top at 4GB Space */ {
			.phys_start = 0xfdb00000,
			.virt_start = 0,
			.size = 0x10000, /* 64KB */
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
		},
		/* RAM */ {
			/*
			 * We could not use 0x80000000 which conflicts with
			 * COMM_REGION_BASE
			 */
			.phys_start = 0x60000000,
			.virt_start = 0x60000000,
			.size = 0x10000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
				JAILHOUSE_MEM_LOADABLE,
		},
		/* communication region */ {
			.virt_start = 0x80000000,
			.size = 0x00001000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_COMM_REGION,
		},
	},

	.irqchips = {
		/* uart2/sdhc1 */ {
			.address = 0x38800000,
			.pin_base = 32,
			.pin_bitmap = {
				(1 << (24 + 32 - 32)) | (1 << (29 + 32 - 32))
			},
		},
		/* IVSHMEM */ {
			.address = 0x38800000,
			.pin_base = 160,
			.pin_bitmap = {
				0xf << (154 + 32 - 160) /* SPI 154-157 */
			},
		},
	},

	.pci_devices = {
		{ /* IVSHMEM 00:00.0 (demo) */
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.domain = 0,
			.bdf = 0 << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
			.shmem_regions_start = 0,
			.shmem_dev_id = 2,
			.shmem_peers = 3,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
		},
		{ /* IVSHMEM 00:01.0 (networking) */
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.domain = 0,
			.bdf = 1 << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
			.shmem_regions_start = 5,
			.shmem_dev_id = 1,
			.shmem_peers = 2,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
		},
	},
};

------=_Part_38130_1976212849.1704803633169--
