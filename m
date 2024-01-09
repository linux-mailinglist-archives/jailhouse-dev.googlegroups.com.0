Return-Path: <jailhouse-dev+bncBC7Y32GTCIIPD47UVQDBUBCQSSQ5M@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3c.google.com (mail-yb1-xb3c.google.com [IPv6:2607:f8b0:4864:20::b3c])
	by mail.lfdr.de (Postfix) with ESMTPS id A238E8285F3
	for <lists+jailhouse-dev@lfdr.de>; Tue,  9 Jan 2024 13:20:03 +0100 (CET)
Received: by mail-yb1-xb3c.google.com with SMTP id 3f1490d57ef6-dbdad99096fsf3724316276.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Jan 2024 04:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1704802802; x=1705407602; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K5wUchNfwWhndrfwYJGAmPaY3BNELJJ6NCB4YDsGMh4=;
        b=D6lNRSJcVPQ4lCxfQSRm0O/+BJnysYGjzBkULj4Ef8s2Mw5a1QYRjuTnIJcbaXjnyH
         6Io68y55bmNv46o8Ie7Hy1g/vIJHkuTQH0e4y3HZoiExd2lBTJUmqoOSNW0PZjlLX4gL
         SX5zjgZkJ6AkMmaXB2TzxvqojYKDcD+3LTnYHK5Ai5V9STj6rEg19p60Rg6f0VZKdqU4
         PBmKct2Zi0Xvkgvhlck11l5AxSsLR4W77SwOKfW5rr7Omm59xsO7cpXICVkZcaPVE69D
         hYbw9SStpr35Agr3BLHcz2uitDfDWifoUkiS1rqW6t5UivoFOYXHa7C5JF32RmXMOonH
         pfXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704802802; x=1705407602; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K5wUchNfwWhndrfwYJGAmPaY3BNELJJ6NCB4YDsGMh4=;
        b=iy2pMz2Dlt6o1EHqVL7HfNBMCfF3do8loKjNC7bAnO75Ki9cZuO0LsU/jpbhHodPAa
         lky67w55FnVGE9xc3GJg5C4tJty7draXhnAn25u4RUg85etZdz6BEwNkzaBSP/T/UiwY
         58FMORld+8LyTJS9NL57hKjnB2t2w2KB4IZZRgrFbTTwBg4CFgkj2OWiijD8N1qRrVDh
         6k88vkqQdq4ixtJu+ioXkzFAEdXQ0qPKB6NRNlWc5WMBqnct+xCiNBLT8sDkAPHKQT7g
         5iFVIdMcN3e2yis5JdBKoDD1uO0+NdkUcJVNLYae78jCXoj0GXm21QTmojpqrwInR8Z3
         PuiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704802802; x=1705407602;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K5wUchNfwWhndrfwYJGAmPaY3BNELJJ6NCB4YDsGMh4=;
        b=mU9iDKWdO9h8vKdS5TTz4yif51MEeOYWG+lyaoeDli9/786ksYDoZLaVM7yYJKjyat
         jnbvmLKp+r4dwiByYC5uuPAY5LLOcs6mPhoACf9BOn9C6KjqU7bJFiyLYWP0gFGj/4bn
         8sKJSbISXXah+yN5xxWQ2kaUMYsCB7+Z457fApHLv6oDu+CHIRmm9DTb2zUG81v+pWxV
         MZ3Si4e5wUK3prKUxwz2M0eup41I2RH0yDb9C8AM0tDg26T50PMeR8Fj+l6yozbh0ouK
         wk0rGprRoVV9/Y+J0CC3KrVclCM74sb34O/NfGf/285mQQ9xIoXAAA10z/9l4YAtHstN
         Clvw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0Yz2xrlOvmfmTQ284KasIbpoCCtK780XJ/seZZ44M+RONq4dStrU
	GMKfxmufKudFFIyS2j8vNN0=
X-Google-Smtp-Source: AGHT+IE3yPC91ahqdY1qO/j8bRyZkdF7UhrqLL0aHkBvIQ73NFGY80dHD9PQWmrfc7CgXlUMSJy3RQ==
X-Received: by 2002:a25:83c6:0:b0:dbe:1e16:ef7 with SMTP id v6-20020a2583c6000000b00dbe1e160ef7mr2804546ybm.85.1704802802147;
        Tue, 09 Jan 2024 04:20:02 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:e093:0:b0:dbd:4632:de3 with SMTP id x141-20020a25e093000000b00dbd46320de3ls21118ybg.0.-pod-prod-06-us;
 Tue, 09 Jan 2024 04:20:01 -0800 (PST)
X-Received: by 2002:a05:690c:a94:b0:5f0:d791:c965 with SMTP id ci20-20020a05690c0a9400b005f0d791c965mr2876854ywb.3.1704802800477;
        Tue, 09 Jan 2024 04:20:00 -0800 (PST)
Date: Tue, 9 Jan 2024 04:19:59 -0800 (PST)
From: wheatfox <enkerewpo@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <412a6c64-3a4d-4151-9293-05b9881f3418n@googlegroups.com>
In-Reply-To: <f42f3913-11ea-4b78-86cb-ab4fe76db882@oth-regensburg.de>
References: <f81eedab-debe-4d19-954a-06b55f2fa4a9n@googlegroups.com>
 <f42f3913-11ea-4b78-86cb-ab4fe76db882@oth-regensburg.de>
Subject: Re: i.MX8MP jailhouse load image stuck at copy_from_user
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_47252_1032528870.1704802799739"
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

------=_Part_47252_1032528870.1704802799739
Content-Type: multipart/alternative; 
	boundary="----=_Part_47253_2027045630.1704802799739"

------=_Part_47253_2027045630.1704802799739
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for your instruction! I tried to edit the linux inmate cell=20
configuration file (imx8mp-linux-demo.c) and I finally get the linux inmate=
=20
to boot, so I think it was mainly a memory region misconfiguration problem.=
=20
(However, the boot progress failed due to VFS fatal error, which I will=20
investigate later...)
The current full output log is attached as attachment.

On Monday, January 8, 2024 at 7:12:46=E2=80=AFPM UTC+8 Ralf Ramsauer wrote:

> Hi,
>
> On 08/01/2024 09:26, wheatfox wrote:
> > I'm using OK8MP board with i.MX8MP CPU. I have already started jailhous=
e=20
> > with imx8mp.cell configuration, and the example gic-demo works fine.=20
> > However, when I try to start a linux inmate using=20
> > imx8mp-linux-demo.cell, the jailhouse's load progress seems stuck.
> >=20
> > After adding some debug print in jailhouse's python script, firmware=20
> > code and kernel module code, I found out that the *copy_from_user* call=
=20
> > in *load_image* function (driver/cell.c) doesn't return and halt=20
> forever: >
> > jailhouse commands:
> > ./tools/jailhouse enable ./imx8mp.cell
> > ./tools/jailhouse cell linux \
> > ./imx8mp-linux-demo.cell \
> > ./kernel/Image \
> > -i ./kernel/ramdisk.img \
>
> For testing, try to not load the ramdisk. The kernel should at least=20
> boot and crash. If that works, we know that there's something odd with=20
> the ramdisk.
>
> Second, double and triple check addresses where things get loaded.=20
> What's in your non-root cell configuration, and where does the=20
> linux-loader try to load stuff? Does that match?
>
> Thanks,
> Ralf
>
> > -d ./kernel/imx8mp-evk-inmate-wheatfox.dtb \
> > -c "clk_ignore_unused console=3Dttymxc1,0x30890000,115200=20
> > earlycon=3Dec_imx6q,0x30890000,115200"
> >=20
> > start linux cell output(with the string 'wheatfox' means it's my custom=
=20
> > debug print):
> > root@OK8MP:/mnt# ./start-linux.sh
> > [wheatfox|python] Jailhouse Linux Cell Boot Helper
> > [wheatfox|python] linux_loader=3D/m[  129.965933] [wheatfox]=20
> > (jailhouse_ioctl) ioctl=3D0x5401 arg=3D281474720244744
> > nt/tools/../inmates/tools/arm64/l[  129.975611] [wheatfox]=20
> > (jailhouse_ioctl) ioctl=3D0x5401 arg=3D281474720244728
> > inux-loader.bin
> > [  129.988033] [wheatfox] (jailhouse_ioctl) ioctl=3D0x40100002=20
> > arg=3D281474720244800
> > [  129.995192] [wheatfox] (jailhouse_ioctl) JAILHOUSE_CELL_CREATE
> > [  130.001072] [wheatfox] (jailhouse_cmd_cell_create) start
> > [  130.006404] [wheatfox] (jailhouse_cmd_cell_create) copy_from_user do=
ne
> > [  130.012960] [wheatfox] (jailhouse_cmd_cell_create) copy_from_user do=
ne
> > [  130.019507] [wheatfox] (jailhouse_cmd_cell_create) cell_id.id =3D -1
> > [  130.095151] IRQ 6: no longer affine to CPU2
> > [  130.095333] CPU2: shutdown
> > [  130.102251] psci: CPU2 killed (polled 0 ms)
> > [  130.155283] CPU3: shutdown
> > [  130.157999] psci: CPU3 killed (polled 0 ms)
> > [wheatfox] in hypercall, code =3D 1, arg1 =3D 2955416576, arg2 =3D 2
> > [wheatfox] in hypercall, JAILHOUSE_HC_CELL_CREATE
> > Adding virtual PCI device 00:00.0 to cell "linux-inmate-demo"
> > Shared memory connection established, peer cells:
> >  "imx8mp"
> > Adding virtual PCI device 00:01.0 to cell "linux-inmate-demo"
> > Shared memory connection established, peer cells:
> >  "imx8mp"
> > [wheatfox] in resume_cpu, cpu_id =3D 2
> > [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
> > [wheatfox] in resume_cpu, cpu_id =3D 3
> > [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
> > Created cell "linux-inmate-demo"
> > Page pool usage after cell creation: mem 82/992, remap 144/131072
> > [wheatfox] in resume_cpu, cpu_id =3D 0
> > [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
> > [  130.231800] [wheatfox] (jailhouse_cmd_cell_create) Created cell=20
> > "linux-inmate-demo"
> > [wheatfox|python] cell created,=20
> >=20
> name=3Db'linux-inmate-demo\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x0=
0\x00\x00\x00'
> > [wheatf[  130.249264] [wheatfox] (jailhouse_ioctl) ioctl=3D0x40300003=
=20
> > arg=3D281474720245360
> > ox|python] trying to load linux_l[  130.257905] [wheatfox]=20
> > (jailhouse_ioctl) JAILHOUSE_CELL_LOAD
> > oader.bin into cell, addr=3D0x0
> > [  130.266684] [wheatfox] (jailhouse_cmd_cell_load) start
> > [  130.274322] [wheatfox] (jailhouse_cmd_cell_load)=20
> > cell_management_prologue(&cell_load.cell_id, &cell) done
> > [wheatfox] in hypercall, code =3D 3, arg1 =3D 1, arg2 =3D 4308871775073=
466112
> > [wheatfox] in hypercall, JAILHOUSE_HC_CELL_SET_LOADABLE
> > [wheatfox] in cell_set_loadable, id =3D 1
> > [wheatfox] cell_management_prologue finished
> > [wheatfox] in resume_cpu, cpu_id =3D 2
> > [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
> > [wheatfox] in resume_cpu, cpu_id =3D 3
> > [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
> > [wheatfox] finished arch_park_cpu
> > [wheatfox] cell->loadable =3D 0
> > [wheatfox] not jumped to out_resume
> > Cell "linux-inmate-demo" can be loaded
> > [wheatfox] in out_resume
> > [wheatfox] in resume_cpu, cpu_id =3D 1
> > [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
> > [  130.342417] [wheatfox] (jailhouse_cmd_cell_load)=20
> > jailhouse_call_arg1(JAILHOUSE_HC_CELL_SET_LOADABLE, cell->id) done
> > [  130.353079] [wheatfox] (jailhouse_cmd_cell_load)=20
> > cell_load.num_preload_images =3D 1
> > [  130.360584] [wheatfox] (jailhouse_cmd_cell_load) load_image(cell,=20
> > image) start, n =3D 1
> > [  130.368444] [wheatfox] (load_image) start
> > [  130.372468] [wheatfox] (load_image) copy_from_user done
> > [  130.377712] [wheatfox] (load_image) image.size =3D 34b0
> > [  130.382776] [wheatfox] (load_image) found suitable memory region,=20
> > mem->virt_start =3D 0, mem->size =3D 10000
> > [  130.392280] [wheatfox] (load_image) image load mem region found
> > [  130.398228] [wheatfox] (load_image) phys_start =3D fdb00000
> > [  130.403653] [wheatfox] (load_image) page_offs =3D 0
> > [  130.408373] [wheatfox] (load_image) image_mem =3D 0000000079dd6ce3
> > [  130.414405] [wheatfox] (load_image) copy_from_user params:
> > [  130.419905] [wheatfox] (load_image) to =3D 0000000079dd6ce3
> > [  130.425329] [wheatfox] (load_image) from =3D 00000000c239ec71
> > [  130.430915] [wheatfox] (load_image) n =3D 34b0
> > [  130.435220] [wheatfox] (load_image) copy_from_user start
> > [  130.440563] [wheatfox] (load_image) copy_from_user done
> > [  130.445822] [wheatfox] (load_image) flush_icache_range done
> > [  130.451429] [wheatfox] (jailhouse_cmd_cell_load) load_image(cell,=20
> > image) done, n =3D 1
> > [  130.459186] [wheatfox] (jailhouse_cmd_cell_load) unlock_out done,=20
> > exiting jailhouse_cmd_cell_load
> > [wheatfox|python] linux_loader.bin loaded
> > [wheatfox|python] trying to load kernel into cell, addr=3D0xc0280000
> > [  130.500262] [wheatfox] (jailhouse_ioctl) ioctl=3D0x40300003=20
> > arg=3D281474720245360
> > [  130.507454] [wheatfox] (jailhouse_ioctl) JAILHOUSE_CELL_LOAD
> > [  130.513165] [wheatfox] (jailhouse_cmd_cell_load) start
> > [  130.518321] [wheatfox] (jailhouse_cmd_cell_load)=20
> > cell_management_prologue(&cell_load.cell_id, &cell) done
> > [wheatfox] in hypercall, code =3D 3, arg1 =3D 1, arg2 =3D 4308871775073=
466112
> > [wheatfox] in hypercall, JAILHOUSE_HC_CELL_SET_LOADABLE
> > [wheatfox] in cell_set_loadable, id =3D 1
> > [wheatfox] cell_management_prologue finished
> > [wheatfox] in resume_cpu, cpu_id =3D 2
> > [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
> > [wheatfox] in resume_cpu, cpu_id =3D 3
> > [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
> > [wheatfox] finished arch_park_cpu
> > [wheatfox] cell->loadable =3D 1
> > [wheatfox] in out_resume
> > [wheatfox] in resume_cpu, cpu_id =3D 1
> > [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
> > [  130.579626] [wheatfox] (jailhouse_cmd_cell_load)=20
> > jailhouse_call_arg1(JAILHOUSE_HC_CELL_SET_LOADABLE, cell->id) done
> > [  130.590182] [wheatfox] (jailhouse_cmd_cell_load)=20
> > cell_load.num_preload_images =3D 1
> > [  130.597678] [wheatfox] (jailhouse_cmd_cell_load) load_image(cell,=20
> > image) start, n =3D 1
> > [  130.605532] [wheatfox] (load_image) start
> > [  130.609557] [wheatfox] (load_image) copy_from_user done
> > [  130.614795] [wheatfox] (load_image) image.size =3D 1ab7200
> > [  130.620131] [wheatfox] (load_image) found suitable memory region,=20
> > mem->virt_start =3D c0000000, mem->size =3D 3d700000
> > [  130.630505] [wheatfox] (load_image) image load mem region found
> > [  130.636699] [wheatfox] (load_image) phys_start =3D c0280000
> > [  130.642128] [wheatfox] (load_image) page_offs =3D 0
> > [  130.646853] [wheatfox] (load_image) image_mem =3D 000000007135b443
> > [  130.652883] [wheatfox] (load_image) copy_from_user params:
> > [  130.658387] [wheatfox] (load_image) to =3D 000000007135b443
> > [  130.663808] [wheatfox] (load_image) from =3D 00000000ebdde5d4
> > [  130.669399] [wheatfox] (load_image) n =3D 1ab7200
> > [  130.673952] [wheatfox] (load_image) copy_from_user start
> >=20
> > then nothing happens after this 'copy_from_user start`, the source code=
=20
> is:
> > printk("[wheatfox] (load_image) copy_from_user start\n");
> > if (copy_from_user(image_mem + page_offs,
> > (void __user *)(unsigned long)image.source_address,
> > image.size))
> > err =3D -EFAULT;
> > printk("[wheatfox] (load_image) copy_from_user done\n");
> >=20
> >=20
> > --=20
> > You received this message because you are subscribed to the Google=20
> > Groups "Jailhouse" group.
> > To unsubscribe from this group and stop receiving emails from it, send=
=20
> > an email to jailhouse-de...@googlegroups.com=20
> > <mailto:jailhouse-de...@googlegroups.com>.
> > To view this discussion on the web visit=20
> >=20
> https://groups.google.com/d/msgid/jailhouse-dev/f81eedab-debe-4d19-954a-0=
6b55f2fa4a9n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/f81eedab-debe-4d19-954a-0=
6b55f2fa4a9n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
> >.
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/412a6c64-3a4d-4151-9293-05b9881f3418n%40googlegroups.com.

------=_Part_47253_2027045630.1704802799739
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for your instruction! I tried to edit the linux inmate cell configur=
ation file (imx8mp-linux-demo.c) and I finally get the linux inmate to boot=
, so I think it was mainly a memory region misconfiguration problem. (Howev=
er, the boot progress failed due to VFS fatal error, which I will investiga=
te later...)<div>The current full output log is attached as attachment.<br =
/><br /></div><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_a=
ttr">On Monday, January 8, 2024 at 7:12:46=E2=80=AFPM UTC+8 Ralf Ramsauer w=
rote:<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.=
8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">Hi,
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
=3D"http://cell_id.id" target=3D"_blank" rel=3D"nofollow" data-saferedirect=
url=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttp://cell_id.id&amp;sou=
rce=3Dgmail&amp;ust=3D1704888983025000&amp;usg=3DAOvVaw2aCPoQw9O03dfu4MjLMQ=
QP">cell_id.id</a> =3D -1
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
<br>&gt; an email to <a href data-email-masked rel=3D"nofollow">jailhouse-d=
e...@googlegroups.com</a>=20
<br>&gt; &lt;mailto:<a href data-email-masked rel=3D"nofollow">jailhouse-de=
...@googlegroups.com</a>&gt;.
<br>&gt; To view this discussion on the web visit=20
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/f81eeda=
b-debe-4d19-954a-06b55f2fa4a9n%40googlegroups.com" target=3D"_blank" rel=3D=
"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=
=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/f81eedab-debe-4d19-954a-=
06b55f2fa4a9n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D17048889830=
26000&amp;usg=3DAOvVaw0PA15vdy81arHdV3jblqGK">https://groups.google.com/d/m=
sgid/jailhouse-dev/f81eedab-debe-4d19-954a-06b55f2fa4a9n%40googlegroups.com=
</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/f81eeda=
b-debe-4d19-954a-06b55f2fa4a9n%40googlegroups.com?utm_medium=3Demail&amp;ut=
m_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://groups.google.com/d/=
msgid/jailhouse-dev/f81eedab-debe-4d19-954a-06b55f2fa4a9n%2540googlegroups.=
com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1=
704888983026000&amp;usg=3DAOvVaw3BhoRgzluy7hA0xaln41Ds">https://groups.goog=
le.com/d/msgid/jailhouse-dev/f81eedab-debe-4d19-954a-06b55f2fa4a9n%40google=
groups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt;.
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/412a6c64-3a4d-4151-9293-05b9881f3418n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/412a6c64-3a4d-4151-9293-05b9881f3418n%40googlegroups.co=
m</a>.<br />

------=_Part_47253_2027045630.1704802799739--

------=_Part_47252_1032528870.1704802799739
Content-Type: text/x-log; charset=UTF-8; name=output_20240109_2015.log
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=output_20240109_2015.log
X-Attachment-Id: 793cf4ce-bb5b-4d2c-918e-9f524f9e8810
Content-ID: <793cf4ce-bb5b-4d2c-918e-9f524f9e8810>

root@OK8MP:~/tmp# ./init.sh
[   42.973036] [wheatfox] (jailhouse_ioctl) ioctl=3D0x40080000 arg=3D300421=
792
[   42.979675] [wheatfox] (jailhouse_ioctl) JAILHOUSE_ENABLE
[   42.985103] [wheatfox] Loading hypervisor image jailhouse.bin

[wheatfox debug version] printk test

Initializing Jailhouse hypervisor  on CPU 1
Code location: 0x0000ffffc0200800
Page pool usage after early setup: mem 39/992, remap 0/131072
Initializing processors:
 CPU 1... OK
 CPU 0... OK
 CPU 3... OK
 CPU 2... OK
Initializing unit: irqchip
Initializing unit: ARM SMMU v3
Initializing unit: ARM SMMU
No SMMU
Initializing unit: PVU IOMMU
Initializing unit: PCI
Adding virtual PCI device 00:00.0 to cell "imx8mp"
Adding virtual PCI device 00:01.0 to cell "imx8mp"
Page pool usage after late setup: mem 65/992, remap 144/131072
Activating hypervisor
[   43.047438] pci-host-generic fd700000.pci: host bridge /pci@0 ranges:
[   43.053936] pci-host-generic fd700000.pci:   MEM 0xfd800000..0xfd803fff =
-> 0xfd800000
[   43.061850] pci-host-generic fd700000.pci: ECAM at [mem 0xfd700000-0xfd7=
fffff] for [bus 00]
[   43.070365] pci-host-generic fd700000.pci: PCI host bridge to bus 0000:0=
0
[   43.077186] pci_bus 0000:00: root bus resource [bus 00]
[   43.082439] pci_bus 0000:00: root bus resource [mem 0xfd800000-0xfd803ff=
f]
[   43.089352] pci 0000:00:00.0: [110a:4106] type 00 class 0xff0000
[   43.095396] pci 0000:00:00.0: reg 0x10: [mem 0x00000000-0x00000fff]
[   43.102173] pci 0000:00:01.0: [110a:4106] type 00 class 0xff0001
[   43.108226] pci 0000:00:01.0: reg 0x10: [mem 0x00000000-0x00000fff]
[   43.117396] pci 0000:00:00.0: BAR 0: assigned [mem 0xfd800000-0xfd800fff=
]
[   43.124226] pci 0000:00:01.0: BAR 0: assigned [mem 0xfd801000-0xfd801fff=
]
[   43.131393] uio_ivshmem 0000:00:00.0: enabling device (0000 -> 0002)
[   43.137866] uio_ivshmem 0000:00:00.0: state_table at 0x00000000fd900000,=
 size 0x0000000000001000
[   43.146684] uio_ivshmem 0000:00:00.0: rw_section at 0x00000000fd901000, =
size 0x0000000000009000
[   43.155442] uio_ivshmem 0000:00:00.0: input_sections at 0x00000000fd90a0=
00, size 0x0000000000006000
[   43.164511] uio_ivshmem 0000:00:00.0: output_section at 0x00000000fd90a0=
00, size 0x0000000000002000
[   43.174134] ivshmem-net 0000:00:01.0: enabling device (0000 -> 0002)
[   43.180598] ivshmem-net 0000:00:01.0: TX memory at 0x00000000fda01000, s=
ize 0x000000000007f000
[   43.189260] ivshmem-net 0000:00:01.0: RX memory at 0x00000000fda80000, s=
ize 0x000000000007f000
[   43.198756] [wheatfox] The Jailhouse is opening.
root@OK8MP:~/tmp# ./start-linux.sh
[wheatfox|python] Jailhouse Linux Cell Boot Helper
[wheatfox|python] ARMCommon setup
[wheatfox|python] kernel_size=3D0x1ab8000
[wheatfox|python] kernel_load_offset=3D0x80000
[wheatfo[   49.898660] [wheatfox] (jailhouse_ioctl) ioctl=3D0x5401 arg=3D28=
1474660921000
x|python] image_size=3D0x1d38000
[[   49.908345] [wheatfox] (jailhouse_ioctl) ioctl=3D0x5401 arg=3D281474660=
920984
wheatfox|python] initrd found, size=3D0x87e6d9
[wheatfox|python] [   49.920730] [wheatfox] (jailhouse_ioctl) ioctl=3D0x401=
00002 arg=3D281474660921056
dtb found, size=3D0x2000
[wheatfox[   49.930572] [wheatfox] (jailhouse_ioctl) JAILHOUSE_CELL_CREATE
|python] ram_regions=3D[<__main__.M[   49.939264] [wheatfox] (jailhouse_cmd=
_cell_create) start
emoryRegion object at 0xffff88e85[   49.947430] [wheatfox] (jailhouse_cmd_c=
ell_create) copy_from_user done
810>]
[wheatfox|python] dtb_addr[   49.956833] [wheatfox] (jailhouse_cmd_cell_cre=
ate) copy_from_user done
=3D0x60000000
[wheatfox|python] ke[   49.966208] [wheatfox] (jailhouse_cmd_cell_create) c=
ell_id.id =3D -1
rnel_addr=3D0x60280000
[wheatfox|python] ramdisk_addr=3D0x637f0000
[wheatfox|python] linux_loader=3D/home/root/tmp/tools/../inmates/tools/arm6=
4/linux-loader.bin
[   50.026238] IRQ 6: no longer affine to CPU2
[   50.026416] CPU2: shutdown
[   50.033328] psci: CPU2 killed (polled 0 ms)
[   50.074367] CPU3: shutdown
[   50.077083] psci: CPU3 killed (polled 0 ms)
[wheatfox] in hypercall, code =3D 1, arg1 =3D 2984322048, arg2 =3D 2
[wheatfox] in hypercall, JAILHOUSE_HC_CELL_CREATE
Adding virtual PCI device 00:00.0 to cell "linux-inmate-demo"
Shared memory connection established, peer cells:
 "imx8mp"
Adding virtual PCI device 00:01.0 to cell "linux-inmate-demo"
Shared memory connection established, peer cells:
 "imx8mp"
[wheatfox] in resume_cpu, cpu_id =3D 2
[wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
[wheatfox] in resume_cpu, cpu_id =3D 3
[wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
Created cell "linux-inmate-demo"
Page pool usage after cell creation: mem 83/992, remap 144/131072
[wheatfox] in resume_cpu, cpu_id =3D 1
[wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
[   50.150268] [wheatfox] (jailhouse_cmd_cell_create) Created cell "linux-i=
nmate-demo"
[wheatfox|python] cell created, n[   50.159234] [wheatfox] (jailhouse_ioctl=
) ioctl=3D0x40300003 arg=3D281474660921616
ame=3Db'linux-inmate-demo\x00\x00\x[   50.168656] [wheatfox] (jailhouse_ioc=
tl) JAILHOUSE_CELL_LOAD
00\x00\x00\x00\x00\x00\x00\x00\x0[   50.176999] [wheatfox] (jailhouse_cmd_c=
ell_load) start
0\x00\x00\x00\x00'
[wheatfox|pyt[   50.184997] [wheatfox] (jailhouse_cmd_cell_load) cell_manag=
ement_prologue(&cell_load.cell_id, &cell) done
hon] trying to load linux_loader.[wheatfox] in hypercall, code =3D 3, arg1 =
=3D 1, arg2 =3D 8987777853597658112
[wheatfox] in hypercall, JAILHOUSE_HC_CELL_SET_LOADABLE
[wheatfox] in cell_set_loadable, id =3D 1
[wheatfox] cell_management_prologue finished
[wheatfox] in resume_cpu, cpu_id =3D 2
[wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
[wheatfox] in resume_cpu, cpu_id =3D 3
[wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
[wheatfox] finished arch_park_cpu
[wheatfox] cell->loadable =3D 0
[wheatfox] not jumped to out_resume
Cell "linux-inmate-demo" can be loaded
[wheatfox] in out_resume
[wheatfox] in resume_cpu, cpu_id =3D 1
[wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
bin into cell, addr=3D0x0
[   50.258628] [wheatfox] (jailhouse_cmd_cell_load) jailhouse_call_arg1(JAI=
LHOUSE_HC_CELL_SET_LOADABLE, cell->id) done
[   50.271377] [wheatfox] (jailhouse_cmd_cell_load) cell_load.num_preload_i=
mages =3D 1
[   50.278898] [wheatfox] (jailhouse_cmd_cell_load) load_image(cell, image)=
 start, n =3D 1
[   50.286767] [wheatfox] (load_image) start
[   50.290812] [wheatfox] (load_image) copy_from_user done
[   50.296075] [wheatfox] (load_image) image.size =3D 34b0
[   50.301184] [wheatfox] (load_image) found suitable memory region, mem->v=
irt_start =3D 0, mem->size =3D 10000
[   50.310699] [wheatfox] (load_image) image load mem region found
[   50.316670] [wheatfox] (load_image) phys_start =3D fdb00000
[   50.322104] [wheatfox] (load_image) page_offs =3D 0
[   50.326954] [wheatfox] (load_image) image_mem =3D 00000000fbe2f860
[   50.332978] [wheatfox] (load_image) copy_from_user params:
[   50.338490] [wheatfox] (load_image) to =3D 00000000fbe2f860
[   50.343903] [wheatfox] (load_image) from =3D 00000000582f0b69
[   50.349502] [wheatfox] (load_image) n =3D 34b0
[   50.353786] [wheatfox] (load_image) copy_from_user start
[   50.359118] [wheatfox] (load_image) copy_from_user done
[   50.364373] [wheatfox] (load_image) flush_icache_range done
[   50.369968] [wheatfox] (jailhouse_cmd_cell_load) load_image(cell, image)=
 done, n =3D 1
[   50.377727] [wheatfox] (jailhouse_cmd_cell_load) unlock_out done, exitin=
g jailhouse_cmd_cell_load
[wheatfox|python] linux_loader.bin loaded
[wheatfox|python] trying to load kernel into cell, addr=3D0x60280000
[   50.418355] [wheatfox] (jailhouse_ioctl) ioctl=3D0x40300003 arg=3D281474=
660921616
[   50.425560] [wheatfox] (jailhouse_ioctl) JAILHOUSE_CELL_LOAD
[   50.431241] [wheatfox] (jailhouse_cmd_cell_load) start
[   50.436411] [wheatfox] (jailhouse_cmd_cell_load) cell_management_prologu=
e(&cell_load.cell_id, &cell) done
[wheatfox] in hypercall, code =3D 3, arg1 =3D 1, arg2 =3D 89877778535976581=
12
[wheatfox] in hypercall, JAILHOUSE_HC_CELL_SET_LOADABLE
[wheatfox] in cell_set_loadable, id =3D 1
[wheatfox] cell_management_prologue finished
[wheatfox] in resume_cpu, cpu_id =3D 2
[wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
[wheatfox] in resume_cpu, cpu_id =3D 3
[wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
[wheatfox] finished arch_park_cpu
[wheatfox] cell->loadable =3D 1
[wheatfox] in out_resume
[wheatfox] in resume_cpu, cpu_id =3D 1
[wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
[   50.497694] [wheatfox] (jailhouse_cmd_cell_load) jailhouse_call_arg1(JAI=
LHOUSE_HC_CELL_SET_LOADABLE, cell->id) done
[   50.508269] [wheatfox] (jailhouse_cmd_cell_load) cell_load.num_preload_i=
mages =3D 1
[   50.515765] [wheatfox] (jailhouse_cmd_cell_load) load_image(cell, image)=
 start, n =3D 1
[   50.523619] [wheatfox] (load_image) start
[   50.527650] [wheatfox] (load_image) copy_from_user done
[   50.532890] [wheatfox] (load_image) image.size =3D 1ab7200
[   50.538214] [wheatfox] (load_image) found suitable memory region, mem->v=
irt_start =3D 60000000, mem->size =3D 10000000
[   50.548585] [wheatfox] (load_image) image load mem region found
[   50.554755] [wheatfox] (load_image) phys_start =3D 60280000
[   50.560184] [wheatfox] (load_image) page_offs =3D 0
[   50.564911] [wheatfox] (load_image) image_mem =3D 00000000dfe20d52
[   50.570939] [wheatfox] (load_image) copy_from_user params:
[   50.576444] [wheatfox] (load_image) to =3D 00000000dfe20d52
[   50.581865] [wheatfox] (load_image) from =3D 0000000093db11e4
[   50.587456] [wheatfox] (load_image) n =3D 1ab7200
[   50.592007] [wheatfox] (load_image) copy_from_user start
[   50.610034] [wheatfox] (load_image) copy_from_user done
[   50.619022] [wheatfox] (load_image) flush_icache_range done
[   50.624706] [wheatfox] (jailhouse_cmd_cell_load) load_image(cell, image)=
 done, n =3D 1
[   50.632464] [wheatfox] (jailhouse_cmd_cell_load) unlock_out done, exitin=
g jailhouse_cmd_cell_load
[wheatfox|python] kernel loaded[   50.649828] [wheatfox] (jailhouse_ioctl) =
ioctl=3D0x40300003 arg=3D281474660921616

[   50.658267] [wheatfox] (jailhouse_ioctl) JAILHOUSE_CELL_LOAD
[   50.664083] [wheatfox] (jailhouse_cmd_cell_load) start
[   50.669257] [wheatfox] (jailhouse_cmd_cell_load) cell_management_prologu=
e(&cell_load.cell_id, &cell) done
[wheatfox] in hypercall, code =3D 3, arg1 =3D 1, arg2 =3D 89877778535976581=
12
[wheatfox] in hypercall, JAILHOUSE_HC_CELL_SET_LOADABLE
[wheatfox] in cell_set_loadable, id =3D 1
[wheatfox] cell_management_prologue finished
[wheatfox] in resume_cpu, cpu_id =3D 2
[wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
[wheatfox] in resume_cpu, cpu_id =3D 3
[wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
[wheatfox] finished arch_park_cpu
[wheatfox] cell->loadable =3D 1
[wheatfox] in out_resume
[wheatfox] in resume_cpu, cpu_id =3D 1
[wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
[   50.730637] [wheatfox] (jailhouse_cmd_cell_load) jailhouse_call_arg1(JAI=
LHOUSE_HC_CELL_SET_LOADABLE, cell->id) done
[   50.741123] [wheatfox] (jailhouse_cmd_cell_load) cell_load.num_preload_i=
mages =3D 1
[   50.748618] [wheatfox] (jailhouse_cmd_cell_load) load_image(cell, image)=
 start, n =3D 1
[   50.756479] [wheatfox] (load_image) start
[   50.760515] [wheatfox] (load_image) copy_from_user done
[   50.765760] [wheatfox] (load_image) image.size =3D c75
[   50.770784] [wheatfox] (load_image) found suitable memory region, mem->v=
irt_start =3D 60000000, mem->size =3D 10000000
[   50.781160] [wheatfox] (load_image) image load mem region found
[   50.787133] [wheatfox] (load_image) phys_start =3D 60000000
[   50.792559] [wheatfox] (load_image) page_offs =3D 0
[   50.797285] [wheatfox] (load_image) image_mem =3D 00000000d74796e2
[   50.803314] [wheatfox] (load_image) copy_from_user params:
[   50.808819] [wheatfox] (load_image) to =3D 00000000d74796e2
[   50.814239] [wheatfox] (load_image) from =3D 00000000edac54f0
[   50.819830] [wheatfox] (load_image) n =3D c75
[   50.824025] [wheatfox] (load_image) copy_from_user start
[   50.829352] [wheatfox] (load_image) copy_from_user done
[   50.834611] [wheatfox] (load_image) flush_icache_range done
[   50.840209] [wheatfox] (jailhouse_cmd_cell_load) load_image(cell, image)=
 done, n =3D 1
[   50.847987] [wheatfox] (jailhouse_cmd_cell_load) unlock_out done, exitin=
g jailhouse_cmd_cell_load
[   50.881058] [wheatfox] (jailhouse_ioctl) ioctl=3D0x40300003 arg=3D281474=
660921616
[   50.888279] [wheatfox] (jailhouse_ioctl) JAILHOUSE_CELL_LOAD
[   50.893960] [wheatfox] (jailhouse_cmd_cell_load) start
[   50.899131] [wheatfox] (jailhouse_cmd_cell_load) cell_management_prologu=
e(&cell_load.cell_id, &cell) done
[wheatfox] in hypercall, code =3D 3, arg1 =3D 1, arg2 =3D 89877778535976581=
12
[wheatfox] in hypercall, JAILHOUSE_HC_CELL_SET_LOADABLE
[wheatfox] in cell_set_loadable, id =3D 1
[wheatfox] cell_management_prologue finished
[wheatfox] in resume_cpu, cpu_id =3D 2
[wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
[wheatfox] in resume_cpu, cpu_id =3D 3
[wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
[wheatfox] finished arch_park_cpu
[wheatfox] cell->loadable =3D 1
[wheatfox] in out_resume
[wheatfox] in resume_cpu, cpu_id =3D 1
[wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
[   50.960426] [wheatfox] (jailhouse_cmd_cell_load) jailhouse_call_arg1(JAI=
LHOUSE_HC_CELL_SET_LOADABLE, cell->id) done
[   50.970990] [wheatfox] (jailhouse_cmd_cell_load) cell_load.num_preload_i=
mages =3D 1
[   50.978485] [wheatfox] (jailhouse_cmd_cell_load) load_image(cell, image)=
 start, n =3D 1
[   50.986328] [wheatfox] (load_image) start
[   50.990348] [wheatfox] (load_image) copy_from_user done
[   50.995585] [wheatfox] (load_image) image.size =3D 87e6d9
[   51.000823] [wheatfox] (load_image) found suitable memory region, mem->v=
irt_start =3D 60000000, mem->size =3D 10000000
[   51.011195] [wheatfox] (load_image) image load mem region found
[   51.017221] [wheatfox] (load_image) phys_start =3D 637f0000
[   51.022649] [wheatfox] (load_image) page_offs =3D 0
[   51.027376] [wheatfox] (load_image) image_mem =3D 00000000ef2f48be
[   51.033405] [wheatfox] (load_image) copy_from_user params:
[   51.038913] [wheatfox] (load_image) to =3D 00000000ef2f48be
[   51.044334] [wheatfox] (load_image) from =3D 00000000b13a69f3
[   51.049925] [wheatfox] (load_image) n =3D 87e6d9
[   51.054390] [wheatfox] (load_image) copy_from_user start
[   51.063600] [wheatfox] (load_image) copy_from_user done
[   51.070095] [wheatfox] (load_image) flush_icache_range done
[   51.075710] [wheatfox] (jailhouse_cmd_cell_load) load_image(cell, image)=
 done, n =3D 1
[   51.083480] [wheatfox] (jailhouse_cmd_cell_load) unlock_out done, exitin=
g jailhouse_cmd_cell_load
[   51.092751] [wheatfox] (jailhouse_ioctl) ioctl=3D0x40300003 arg=3D281474=
660921616
[   51.099912] [wheatfox] (jailhouse_ioctl) JAILHOUSE_CELL_LOAD
[   51.105605] [wheatfox] (jailhouse_cmd_cell_load) start
[   51.110764] [wheatfox] (jailhouse_cmd_cell_load) cell_management_prologu=
e(&cell_load.cell_id, &cell) done
[wheatfox] in hypercall, code =3D 3, arg1 =3D 1, arg2 =3D 89877778535976581=
12
[wheatfox] in hypercall, JAILHOUSE_HC_CELL_SET_LOADABLE
[wheatfox] in cell_set_loadable, id =3D 1
[wheatfox] cell_management_prologue finished
[wheatfox] in resume_cpu, cpu_id =3D 2
[wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
[wheatfox] in resume_cpu, cpu_id =3D 3
[wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
[wheatfox] finished arch_park_cpu
[wheatfox] cell->loadable =3D 1
[wheatfox] in out_resume
[wheatfox] in resume_cpu, cpu_id =3D 1
[wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
[   51.171973] [wheatfox] (jailhouse_cmd_cell_load) jailhouse_call_arg1(JAI=
LHOUSE_HC_CELL_SET_LOADABLE, cell->id) done
[   51.182628] [wheatfox] (jailhouse_cmd_cell_load) cell_load.num_preload_i=
mages =3D 1
[   51.190127] [wheatfox] (jailhouse_cmd_cell_load) load_image(cell, image)=
 start, n =3D 1
[   51.198056] [wheatfox] (load_image) start
[   51.202084] [wheatfox] (load_image) copy_from_user done
[   51.207326] [wheatfox] (load_image) image.size =3D 20
[   51.212216] [wheatfox] (load_image) found suitable memory region, mem->v=
irt_start =3D 0, mem->size =3D 10000
[   51.221725] [wheatfox] (load_image) image load mem region found
[   51.227678] [wheatfox] (load_image) phys_start =3D fdb01000
[   51.233107] [wheatfox] (load_image) page_offs =3D 0
[   51.237829] [wheatfox] (load_image) image_mem =3D 00000000769f235a
[   51.243860] [wheatfox] (load_image) copy_from_user params:
[   51.249362] [wheatfox] (load_image) to =3D 00000000769f235a
[   51.254785] [wheatfox] (load_image) from =3D 00000000b780afaa
[   51.260373] [wheatfox] (load_image) n =3D 20
[   51.264484] [wheatfox] (load_image) copy_from_user start
[   51.269808] [wheatfox] (load_image) copy_from_user done
[   51.275062] [wheatfox] (load_image) flush_icache_range done
[   51.280656] [wheatfox] (jailhouse_cmd_cell_load) load_image(cell, image)=
 done, n =3D 1
[   51.288427] [wheatfox] (jailhouse_cmd_cell_load) unlock_out done, exitin=
g jailhouse_cmd_cell_load
[wheatfox|python] trying to start[   51.297542] [wheatfox] (jailhouse_ioctl=
) ioctl=3D0x40280004 arg=3D281474660921616
 cell
[   51.307482] [wheatfox] (jailhouse_ioctl) JAILHOUSE_CELL_START
[   51.313829] [wheatfox] (jailhouse_cmd_cell_start) start
[   51.319078] [wheatfox] (jailhouse_cmd_cell_start) copy_from_user(&cell_i=
d, arg, sizeof(cell_id)) done
[   51.328317] [wheatfox] (jailhouse_cmd_cell_start) cell_management_prolog=
ue(&cell_id, &cell) done
[wheatfox] in hypercall, code =3D 2, arg1 =3D 1, arg2 =3D 89877778535976581=
12
[wheatfox] in hypercall, JAILHOUSE_HC_CELL_START
[wheatfox] in cell_start, id =3D 1
[wheatfox] in cell_start, cell->loadable =3D 1
[wheatfox] cell is loadable
[wheatfox] finished unmap all loadable memory regions from the root cell
[wheatfox] system_config->platform_info.pci_mmconfig_base =3D 4251975680
[wheatfox] finished setting comm_region
[wheatfox] finished pci_cell_reset and arch_cell_reset
[wheatfox] in resume_cpu, cpu_id =3D 2
[wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
[wheatfox] in resume_cpu, cpu_id =3D 3
[wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
[wheatfox][    0.000000] Booting Linux on physical CPU 0x0000000002 [0x410f=
d034]
[    0.000000] Linux version 5.4.70-2.3.0+g4f2631b022d8 (oe-user@oe-host) (=
gcc version 9.2.0 (GCC)) #1 SMP PREEMPT Tue Jul 13 14:02:45 UTC 2021
[    0.000000] Machine model: Freescale i.MX8MP EVK
[    0.000000] earlycon: ec_imx6q0 at MMIO 0x0000000030890000 (options '115=
200')
[    0.000000] printk: bootconsole [ec_imx6q0] enabled
[    0.000000] efi: Getting EFI parameters from FDT:
[    0.000000] efi: UEFI not found.
[    0.000000] cma: Failed to reserve 320 MiB
 finished arch[    0.000000] NUMA: No NUMA configuration found
[    0.000000] NUMA: Faking a node at [mem 0x0000000060000000-0x000000006ff=
fffff]
[    0.000000] NUMA: NODE_DATA [mem 0x6ff7c500-0x6ff7dfff]
[    0.000000] Zone ranges:
[    0.000000]   DMA32    [mem 0x0000000060000000-0x000000006fffffff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000060000000-0x000000006fffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000060000000-0x000000006ffff=
fff]
_r[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.1 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: MIGRATE_INFO_TYPE not supported.
[    0.000000] psci: SMC Calling Convention v1.1
[    0.000000] percpu: Embedded 24 pages/cpu s58904 r8192 d31208 u98304
[    0.000000] Detected VIPT I-cache on CPU0
[    0.000000] CPU features: detected: ARM erratum 845719
[    0.000000] CPU features: detected: GIC system register CPU interface
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 64512
[    0.000000] Policy zone: DMA32
[    0.000000] Kernel command line: clk_ignore_unused console=3Dttymxc1,0x3=
0890000,115200 earlycon=3Dec_imx6q,0x30890000,115200
[    0.000000] Dentry cache hash table entries: 32768 (order: 6, 262144 byt=
es, linear)
[    0.000000] Inode-cache hash table entries: 16384 (order: 5, 131072 byte=
s, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
eset_cpu
[wheatfox] Started cell "linu[    0.000000] Memory: 207552K/262144K availab=
le (16636K kernel code, 1244K rwdata, 6556K rodata, 2880K init, 1017K bss, =
54592K reserved, 0K cma-reserved)
[    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D2, N=
odes=3D1
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu: =09RCU restricting CPUs from NR_CPUS=3D256 to nr_cpu_id=
s=3D2.
[    0.000000] =09Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 2=
5 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D2
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] GICv3: 160 SPIs implemented
[    0.000000] GICv3: 0 Extended SPIs implemented
[    0.000000] GICv3: Distributor has no Range Selector support
[    0.000000] GICv3: 16 PPIs implemented
[    0.000000] GICv3: no VLPI support, no direct LPI support
[    0.000000] GICv3: CPU0: found redistributor 2 region 0:0x00000000388c00=
00
[    0.000000] ITS: No ITS available, not enabling LPIs
[    0.000000] random: get_random_bytes called from start_kernel+0x2b8/0x44=
c with crng_init=3D0
[    0.000000] arch_timer: cp15 timer(s) running at 8.33MHz (virt).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cy=
cles: 0x1ec0311ec, max_idle_ns: 440795202152 ns
[    0.000002] sched_clock: 56 bits at 8MHz, resolution 120ns, wraps every =
2199023255541ns
[    0.007757] Console: colour dummy device 80x25
[    0.011956] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 16.66 BogoMIPS (lpj=3D33333)
[    0.021754] pid_max: default: 32768 minimum: 301
[    0.026216] LSM: Security Framework initializing
[    0.030618] Mount-cache hash table entries: 512 (order: 0, 4096 bytes, l=
inear)
[    0.037505] Mountpoint-cache hash table entries: 512 (order: 0, 4096 byt=
es, linear)
[    0.045653] ASID allocator initialised with 32768 entries
[    0.050060] rcu: Hierarchical SRCU implementation.
[    0.054734] EFI services will not be available.
[    0.058999] smp: Bringing up secondary CPUs ...
[    0.063489] Detected VIPT I-cache on CPU1
[    0.063513] GICv3: CPU1: found redistributor 3 region 0:0x00000000388e00=
00
[    0.063544] CPU1: Booted secondary processor 0x0000000003 [0x410fd034]
[    0.063605] smp: Brought up 1 node, 2 CPUs
[    0.083838] SMP: Total of 2 processors activated.
[    0.088338] CPU features: detected: 32-bit EL0 Support
[    0.093263] CPU features: detected: CRC32 instructions
x-inmate-demo"
[wheatfox] in resume_cpu, cpu_id =3D[    0.104920] CPU: All CPU(s) started =
at EL1
[    0.106263] alternatives: patching kernel code
[    0.111213] devtmpfs: initialized
[    0.114572] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 7645041785100000 ns
[    0.123015] futex hash table entries: 512 (order: 3, 32768 bytes, linear=
)
[    0.129626] pinctrl core: initialized pinctrl subsystem
[    0.134833] DMI not present or invalid.
[    0.138312] NET: Registered protocol family 16
[    0.142636] DMA: preallocated 256 KiB pool for atomic allocations
[    0.148259] audit: initializing netlink subsys (disabled)
[    0.153511] audit: type=3D2000 audit(0.100:1): state=3Dinitialized audit=
_enabled=3D0 res=3D1
[    0.160895] cpuidle: using governor menu
[    0.164734] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers=
.
[    0.171296] Serial: AMBA PL011 UART driver
[    0.175036] imx mu driver is registered.
[    0.178766] imx rpmsg driver is registered.
 1
[wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
[    0.192826] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    0.196569] HugeTLB registered 32.0 MiB page size, pre-allocated 0 pages
[    0.202983] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.209365] HugeTLB registered 64.0 KiB page size, pre-allocated 0 pages
[    0.216605] cryptd: max_cpu_qlen set to 1000
[    0.221791] ACPI: Interpreter disabled.
[    0.223957] iommu: Default domain type: Translated
[    0.228371] vgaarb: loaded
[    0.231074] SCSI subsystem initialized
[    0.234718] usbcore: registered new interface driver usbfs
[    0.239746] usbcore: registered new interface driver hub
[    0.244736] usbcore: registered new device driver usb
[    0.249753] mc: Linux media interface: v0.10
[    0.253618] videodev: Linux video capture interface: v2.00
[    0.258902] pps_core: LinuxPPS API ver. 1 registered
[    0.263599] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo =
Giometti <giometti@linux.it>
[    0.272361] PTP clock support registered
[    0.276144] EDAC MC: Ver: 3.0.0
[    0.279476] No BMan portals available!
[    0.282818] QMan: Allocated lookup table at (____ptrval____), entry coun=
t 65537
[    0.289722] No QMan portals available!
[    0.293290] No USDPAA memory, no 'fsl,usdpaa-mem' in device-tree
[    0.299226] FPGA manager framework
[    0.302342] Advanced Linux Sound Architecture Driver Initialized.
[    0.308417] Bluetooth: Core ver 2.22
[    0.311535] NET: Registered protocol family 31
[    0.315768] Bluetooth: HCI device and connection manager initialized
[    0.321853] Bluetooth: HCI socket layer initialized
[    0.326518] Bluetooth: L2CAP socket layer initialized
[    0.331356] Bluetooth: SCO socket layer initialized
[    0.336338] clocksource: Switched to clocksource arch_sys_counter
[    0.341986] VFS: Disk quotas dquot_6.6.0
[    0.345637] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byte=
s)
[    0.352307] pnp: PnP ACPI: disabled
Unhandled data read at 0x6209[    0.360575] thermal_sys: Registered thermal=
 governor 'step_wise'
[    0.360578] thermal_sys: Registered thermal governor 'power_allocator'
[    0.363817] NET: Registered protocol family 2
[    0.374385] tcp_listen_portaddr_hash hash table entries: 256 (order: 0, =
4096 bytes, linear)
[    0.382153] TCP established hash table entries: 2048 (order: 2, 16384 by=
tes, linear)
[    0.389544] TCP bind hash table entries: 2048 (order: 3, 32768 bytes, li=
near)
[    0.396375] TCP: Hash tables configured (established 2048 bind 2048)
[    0.402485] UDP hash table entries: 256 (order: 1, 8192 bytes, linear)
[    0.408696] UDP-Lite hash table entries: 256 (order: 1, 8192 bytes, line=
ar)
[    0.415440] NET: Registered protocol family 1
[    0.419829] RPC: Registered named UNIX socket transport module.
[    0.425194] RPC: Registered udp transport module.
[    0.429685] RPC: Registered tcp transport module.
[    0.434182] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.440668] PCI: CLS 0 bytes, default 64
[    0.444215] Unpacking initramfs...
[    0.447384] Initramfs unpacking failed: invalid magic at start of compre=
ssed archive
9[    0.457471] Freeing initrd memory: 8696K
[    0.458846] kvm [1]: HYP mode not available
[    0.464897] Initialise system trusted keyrings
[    0.466941] workingset: timestamp_bits=3D44 max_order=3D16 bucket_order=
=3D0
abc(4)

FATAL: unhandled tra[    0.478108] squashfs: version 4.0 (2009/01/31) Phill=
ip Lougher
[    0.481654] NFS: Registering the id_resolver key type
[    0.485958] Key type id_resolver registered
[    0.489934] Key type id_legacy registered
[    0.493772] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    0.500199] jffs2: version 2.2. (NAND) =C2=A9 2001-2006 Red Hat, Inc.
[    0.506352] 9p: Installing v9fs 9p2000 file system support
p (exception class 0x24)
Cell state before exception:
 pc: ffff800010a5dbd8   lr: ffff800010a50f38 spsr: 20000005     EL1[    0.5=
24145] Key type asymmetric registered
[    0.525437] Asymmetric key parser 'x509' registered
[    0.530122] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor 244)
[    0.537184] io scheduler mq-deadline registered
[    0.541516] io scheduler kyber registered
[    0.546333] pci-host-generic fd700000.pci: host bridge /pci@fd700000 ran=
ges:
[    0.552117] pci-host-generic fd700000.pci:   MEM 0x10000000..0x1000ffff =
-> 0x10000000
[    0.559635] pci-host-generic fd700000.pci: ECAM at [mem 0xfd700000-0xfd7=
fffff] for [bus 00]
[    0.567696] pci-host-generic fd700000.pci: PCI host bridge to bus 0000:0=
0
[    0.574112] pci_bus 0000:00: root bus resource [bus 00]
[    0.579102] pci_bus 0000:00: root bus resource [mem 0x10000000-0x1000fff=
f]
[    0.585709] pci 0000:00:00.0: [110a:4106] type 00 class 0xff0000
[    0.591455] pci 0000:00:00.0: reg 0x10: [mem 0x00000000-0x00000fff]
[    0.597601] pci 0000:00:01.0: [110a:4106] type 00 class 0xff0001
[    0.603201] pci 0000:00:01.0: reg 0x10: [mem 0x00000000-0x00000fff]
[    0.609472] pci 0000:00:00.0: BAR 0: assigned [mem 0x10000000-0x10000fff=
]
[    0.615691] pci 0000:00:01.0: BAR 0: assigned [mem 0x10001000-0x10001fff=
]
[    0.622721] EINJ: ACPI disabled.
[    0.625873] Bus freq driver module loaded
[    0.631680] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.636267] 30a60000.serial: ttymxc3 at MMIO 0x30a60000 (irq =3D 5, base=
_baud =3D 1500000) is a IMX

 sp: ffff800010003d50  esr: 24 1 1830006
 [    0.649785] loop: module loaded
[    0.651289] imx ahci driver is registered.
[    0.655200] libphy: Fixed MDIO Bus: probed
[    0.658643] tun: Universal TUN/TAP device driver, 1.6
[    0.663096] thunder_xcv, ver 1.0
[    0.665980] thunder_bgx, ver 1.0
[    0.669043] nicpf, ver 1.0
[    0.671723] Freescale FM module, FMD API version 21.1.0
[    0.676637] Freescale FM Ports module
[    0.680093] fsl_mac: fsl_mac: FSL FMan MAC API based driver
[    0.685466] fsl_dpa: FSL DPAA Ethernet driver
[    0.689628] fsl_advanced: FSL DPAA Advanced drivers:
[    0.694349] fsl_proxy: FSL DPAA Proxy initialization driver
[    0.699709] fsl_oh: FSL FMan Offline Parsing port driver
[    0.705059] hclge is initializing
[    0.707928] hns3: Hisilicon Ethernet Network Driver for Hip08 Family - v=
ersion
[    0.714850] hns3: Copyright (c) 2017 Huawei Corporation.
[    0.719971] e1000: Intel(R) PRO/1000 Network Driver - version 7.3.21-k8-=
NAPI
[    0.726683] e1000: Copyright (c) 1999-2006 Intel Corporation.
[    0.732209] e1000e: Intel(R) PRO/1000 Network Driver - 3.2.6-k
[    0.737765] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    0.743467] igb: Intel(R) Gigabit Ethernet Network Driver - version 5.6.=
0-k
[    0.750099] igb: Copyright (c) 2007-2014 Intel Corporation.
[    0.755459] igbvf: Intel(R) Gigabit Virtual Function Network Driver - ve=
rsion 2.4.0-k
[    0.762932] igbvf: Copyright (c) 2009 - 2012 Intel Corporation.
[    0.768660] sky2: driver version 1.30
[    0.772391] ivshmem-net 0000:00:01.0: enabling device (0000 -> 0002)
[    0.778243] ivshmem-net 0000:00:01.0: TX memory at 0x00000000fda80000, s=
ize 0x000000000007f000
[    0.786444] ivshmem-net 0000:00:01.0: RX memory at 0x00000000fda01000, s=
ize 0x000000000007f000
[    0.795237] uio_ivshmem 0000:00:00.0: enabling device (0000 -> 0002)
[    0.800797] uio_ivshmem 0000:00:00.0: state_table at 0x00000000fd900000,=
 size 0x0000000000001000
[    0.809192] uio_ivshmem 0000:00:00.0: rw_section at 0x00000000fd901000, =
size 0x0000000000009000
[    0.817523] uio_ivshmem 0000:00:00.0: input_sections at 0x00000000fd90a0=
00, size 0x0000000000006000
[    0.826185] uio_ivshmem 0000:00:00.0: output_section at 0x00000000fd90e0=
00, size 0x0000000000002000
[    0.835173] VFIO - User Level meta-driver version: 0.3
[    0.840452] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    0.846019] ehci-pci: EHCI PCI platform driver
[    0.850294] ehci-platform: EHCI generic platform driver
[    0.855301] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    0.861198] ohci-pci: OHCI PCI platform driver
[    0.865460] ohci-platform: OHCI generic platform driver
[    0.870671] usbcore: registered new interface driver uas
[    0.875556] usbcore: registered new interface driver usb-storage
[    0.881321] usbcore: registered new interface driver usbserial_generic
[    0.887535] usbserial: USB Serial support registered for generic
[    0.893288] usbcore: registered new interface driver ftdi_sio
[    0.898808] usbserial: USB Serial support registered for FTDI USB Serial=
 Device
[    0.905794] usbcore: registered new interface driver usb_serial_simple
[    0.912030] usbserial: USB Serial support registered for carelink
[    0.917868] usbserial: USB Serial support registered for zio
[    0.923278] usbserial: USB Serial support registered for funsoft
[    0.929031] usbserial: USB Serial support registered for flashloader
[    0.935115] usbserial: USB Serial support registered for google
[    0.940778] usbserial: USB Serial support registered for libtransistor
[    0.947028] usbserial: USB Serial support registered for vivopay
[    0.952779] usbserial: USB Serial support registered for moto_modem
[    0.958778] usbserial: USB Serial support registered for motorola_tetra
[    0.965112] usbserial: USB Serial support registered for novatel_gps
[    0.971197] usbserial: USB Serial support registered for hp4x
[    0.976695] usbserial: USB Serial support registered for suunto
[    0.982361] usbserial: USB Serial support registered for siemens_mpi
[    0.988464] usbcore: registered new interface driver usb_ehset_test
[    0.995478] i2c /dev entries driver
[    0.998493] Bluetooth: HCI UART driver ver 2.3
[    1.002023] Bluetooth: HCI UART protocol H4 registered
[    1.006934] Bluetooth: HCI UART protocol BCSP registered
[    1.012031] Bluetooth: HCI UART protocol LL registered
[    1.016934] Bluetooth: HCI UART protocol ATH3K registered
[    1.022112] Bluetooth: HCI UART protocol Three-wire (H5) registered
[    1.028139] Bluetooth: HCI UART protocol Broadcom registered
[    1.033536] Bluetooth: HCI UART protocol QCA registered
[    1.038657] imx-cpufreq-dt: probe of imx-cpufreq-dt failed with error -2
[    1.045162] sdhci: Secure Digital Host Controller Interface driver
[    1.050851] sdhci: Copyright(c) Pierre Ossman
[    1.055083] Synopsys Designware Multimedia Card Interface Driver
[    1.060892] sdhci-pltfm: SDHCI platform and OF driver helper
[    1.066364] sdhci-esdhc-imx 30b60000.mmc: could not get pinctrl
[    1.071860] mmc2: CQHCI version 5.10
x0: ffff00007823c110   x1: ffff00007823e[    1.081221] mmc2: 3.3V regulator=
 output did not became stable
b80   x2: ffff800011fb8ab0
 x3: ffff800010a5dbd8   x4: 0000000000000000   x5: ffff80006e349000
 x6: 0000000002db9815   x7: ffff00007a0003e0   x8: ffff800011a51ff8
 x9: ffff800011a52000  x10: 0000000000000040  x11: 0000000000000001
x12: 0000000000000009  x13: 0000000[    1.109155] mmc2: SDHCI controller on=
 30b60000.mmc [30b60000.mmc] using ADMA
[    1.113661] ledtrig-cpu: registered to indicate activity on CPUs
[    1.119755] usbcore: registered new interface driver usbhid
[    1.124436] usbhid: USB HID core driver
[    1.128534] No fsl,qman node
[    1.130844] Freescale USDPAA process driver
[    1.134858] fsl-usdpaa: no region found
[    1.138517] Freescale USDPAA process IRQ driver
000000[    1.145906] pktgen: Packet Generator for packet performance testin=
g. Version: 2.75
[    1.150832] NET: Registered protocol family 26
[    1.155362] NET: Registered protocol family 10
[    1.159687] Segment Routing with IPv6
[    1.162648] NET: Registered protocol family 17
[    1.166929] Bluetooth: RFCOMM TTY layer initialized
[    1.171524] Bluetooth: RFCOMM socket layer initialized
[    1.176450] Bluetooth: RFCOMM ver 1.11
[    1.180015] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[    1.185099] Bluetooth: BNEP filters: protocol multicast
[    1.190102] Bluetooth: BNEP socket layer initialized
[    1.194849] Bluetooth: HIDP (Human Interface Emulation) ver 1.2
[    1.200518] Bluetooth: HIDP socket layer initialized
[    1.205296] 8021q: 802.1Q VLAN Support v1.8
[    1.209278] lib80211: common routines for IEEE802.11 drivers
[    1.214774] 9pnet: Installing 9P2000 support
[    1.218789] tsn generic netlink module v1 init...
[    1.223313] Key type dns_resolver registered
[    1.227648] registered taskstats version 1
[    1.231277] Loading compiled-in X.509 certificates
[    1.237052] hctosys: unable to open rtc device (rtc0)
[    1.240785] cfg80211: Loading compiled-in X.509 certificates for regulat=
ory database
[    1.249343] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    1.254432] platform regulatory.0: Direct firmware load for regulatory.d=
b failed with error -2
[    1.256367] clk: Not disabling unused clocks
[    1.262614] platform regulatory.0: Falling back to sysfs fallback for: r=
egulatory.db
[    1.266688] ALSA device list:
[    1.266692]   No soundcards found.
[    1.280199] Warning: unable to open an initial console.
[    1.285305] VFS: Cannot open root device "(null)" or unknown-block(0,0):=
 error -6
[    1.292357] Please append a correct "root=3D" boot option; here are the =
available partitions:
[    1.300368] Kernel panic - not syncing: VFS: Unable to mount root fs on =
unknown-block(0,0)
[    1.308263] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.4.70-2.3.0+g4f26=
31b022d8 #1
[    1.315593] Hardware name: Freescale i.MX8MP EVK (DT)
[    1.320426] Call trace:
[    1.322766]  dump_backtrace+0x0/0x140
[    1.326262]  show_stack+0x14/0x20
[    1.329431]  dump_stack+0xb4/0x114
[    1.332679]  panic+0x158/0x324
[    1.335596]  mount_block_root+0x1d0/0x284
[    1.339428]  mount_root+0x124/0x158
[    1.342761]  prepare_namespace+0x12c/0x18c
[    1.346678]  kernel_init_freeable+0x210/0x23c
[    1.350845]  kernel_init+0x10/0x100
[    1.354179]  ret_from_fork+0x10/0x1c
[    1.357596] SMP: stopping secondary CPUs
[    1.361349] Kernel Offset: disabled
[    1.364677] CPU features: 0x0002,2000200c
[    1.368509] Memory Limit: none
[    1.371431] ---[ end Kernel panic - not syncing: VFS: Unable to mount ro=
ot fs on unknown-block(0,0) ]---
002  x14: 0000000000000000
x15: 0000000000000009  x16: 0000000000000000  x17: 0000000000000000
x18: 0000000000000000  x19: 0000000000000000  x20: 0000000000000000
x21: ffff00007823c840  x22: ffff800011fb8ab0  x23: 0000000000003560
x24: ffff00007713f560  x25: 000000000000012c  x26: ffff00007713c000
x27: ffff00007823eb80  x28: ffff00007823c840  x29: ffff800010003d50

Parking CPU 0 (Cell: "imx8mp")

------=_Part_47252_1032528870.1704802799739--
