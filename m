Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBLNR56WAMGQE3TJVCPA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B66826C4F
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Jan 2024 12:12:48 +0100 (CET)
Received: by mail-lj1-x23b.google.com with SMTP id 38308e7fff4ca-2ccc4dce806sf13866481fa.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Jan 2024 03:12:48 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704712367; cv=pass;
        d=google.com; s=arc-20160816;
        b=RkE8Rr1IYVh2pHPfVMVb2zDu4Fy3yhyezdFME1iNIlD70INSi0i8ueXjg8dgvhSxIp
         8aMphlBybc7XzEJLS8i9WMNYv79sbhRdtdhbY5T5U3GOgPkD5lhbc6/mrHZmdxAok6Q5
         JoPpQ1Emp7ooX0fu2Q5TlVzDdKr8PAu0BQJw3H0s6J+DFu5dtK+4o8LloFGuxmqzgN+n
         bR92heqDCXdgzcQUmqii7fkNY33Qv79G3wVPjT6sJnOszaZ5th0SumynWr2r/8rExHlm
         p2km3AkXg5pXofQVhw28J/xcLv14rT5H990uCwCRpHVvN2irEtoJj9EBKGf+XZuGus4C
         6/Eg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=zv/UhL/mnwT+fuEIh9APsgjI+e1IYUrYNJHo1jp54TM=;
        fh=AmrO4dgiJcsriEKGfeYUx9aYBonJEBZZGKJohXjIX6o=;
        b=J89LbEzCoMC5VQmzLaZEH3KSqa1IRa309GxnFTQ7J4FrMizECYC9DsCSrx8ub82VIs
         TZtkzqrhy03Ys51Vk+gbL3oXsYOosTlYqQ11QilO4wZD9NnBAK2vPW2KOmlZ1OB7P1V8
         RZorCZtV1NyvUmVZgnYmVeW68pf7VLmHaR8YbWByJMlE+JLk2YeXRN3n0NSQqaHZMUiF
         Hza2XM90/S0OX+llML9sQlkCF130uoI7+LF3BUVLYwh1sfSpIB7tL1LTUWkcn/bsNctC
         tb0g2ddWsAFE2x4vsp68JK/Zz6KBA8ODwVoiSFheHdqJw7jXax7HcYfwHUzIz6H1/clC
         yuMg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta03-20220613 header.b=DphX73wr;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.235.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1704712367; x=1705317167; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=zv/UhL/mnwT+fuEIh9APsgjI+e1IYUrYNJHo1jp54TM=;
        b=rAFJUfvfc7jKIo45RbKEZpFFi9bvdTYmvBz2eIUHA1laP2aH2YQx5s6fzU4wi4IPFs
         NYqJSU2u/p5CT6XsxDvMRh28LU1JS7ed+XFkWD0ASAsLxM16O1U4OYzJe789of7EhCz9
         8rw+kK71+LiP6EwDAWd/10SmL5xhB1yaGTaoLQR4pEg3cB1DVXPKb4OGvYdg9Q2C5yNk
         hb7bEBpcYmIobamYQgWc7pN+u9eF1vkfur/cKdifocwOlD/riCaL/1e/4X58xWvCaWu9
         D1zNsWiLehY1qJtCcntGXO1hFsaspFRQBBmVuTa88clJHFGk/eLFvdBSaMqpt24rKLHx
         ZKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704712367; x=1705317167;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zv/UhL/mnwT+fuEIh9APsgjI+e1IYUrYNJHo1jp54TM=;
        b=Q9CQ+OpRX9Pe/xVzShsNFxgg3pzrT8WzKrHRA4uFuJ0ceFNr8awipZlZPF2XJIEdk9
         Dg3YnUasdq3weslQ6x/myum4f1ibg5BUosry9HVXlIZDPhd/KrsIYT0IUjtobcXgHfcF
         nMEVR7CmT/GggtBzE7R54htMKyI7i6iUQJsRRK9GPlF8ivqFfrlEebWn2aZO7aLyEwlp
         oE3Ofj2vnzNU77hlPKq3pT2z/2iGnUc8nsVNy2F07PJJq+9xWWD9e7ZSqrGvmtGEHdyv
         seRGRMVroTXvhjGl7IjJ58IF9wjbnLzULaaxoV2NiLIXNoUfRyrYOLfnffIf8qKbjNbf
         ojgA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YwFdoki+ND33UM9P8nLECilS1ZExdvJUhNu4e0Y2cNTs0qESrql
	bsa/TxEwOPLQUQpgfoPCdsQ=
X-Google-Smtp-Source: AGHT+IGGnfYrBIShHs/HX2ET9FBDNkDpGyZMigynlyqAsKwNYAeEN3ZKmgwHdF9jqMWapOKMdUtcpA==
X-Received: by 2002:a2e:a595:0:b0:2cd:56be:c8c4 with SMTP id m21-20020a2ea595000000b002cd56bec8c4mr582319ljp.66.1704712366433;
        Mon, 08 Jan 2024 03:12:46 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:51ca:b0:555:e404:cf3b with SMTP id
 r10-20020a05640251ca00b00555e404cf3bls302408edd.1.-pod-prod-05-eu; Mon, 08
 Jan 2024 03:12:43 -0800 (PST)
X-Received: by 2002:a50:f69b:0:b0:556:e1ef:4919 with SMTP id d27-20020a50f69b000000b00556e1ef4919mr2107501edn.7.1704712363566;
        Mon, 08 Jan 2024 03:12:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704712363; cv=none;
        d=google.com; s=arc-20160816;
        b=qEL8Pxuv7FeFgD5Raj0n4UBSY+NFn5ZAGPvqvdmN+Ckg7mskuo5+miS/D/P0xazUYt
         LIpyBpU5TYkx6wk6X4AUqU91Q44yOETwz1pilQ5xJ8XjSkeOCJZ909Ga/2ygvRyXhMQt
         HIvRHvNZgzDo4ZPz1OoP40bRkHOS/PvdbSk7zdoVKUavCfNoY4x7NUz0RKJ1/s1Ix/jW
         gH0OPOxPsf07wp2vetorLn1Sw/Pr3mkAIFeJoNZVoS/mC+VgAoX9nSgwHEXJu4S8cfJV
         1vgKpfFECsaqk8/6kMT2KwWAUjvJE0bHZ57lI9pI36GmEhb0DOsF9MMWQ36IIP3HpkY9
         WCrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=4cB92L6Q/hCR63UT1MQKWjjuaEjN69hddsFPDHYW5ik=;
        fh=AmrO4dgiJcsriEKGfeYUx9aYBonJEBZZGKJohXjIX6o=;
        b=LcfO2s1G8M2SMtm1rZ3MdsVk134scZjaSCbUcK7ezvCu3Z00GBeWkLVl2REW0qCFJK
         gdmsKIV4nhP741xybJCVByhoJws28Yjb2QlIkUzZHaYfl0y42Un1nAZN3/yRS/gT0KE0
         yvMuQ7azB8obeWN48ZeiWUuQJtkusirjmCI678WBKPXBA/k3A2/i0tMabvquyj/tTh7V
         IvAlylZ/yERFnp8/zsgOcmBuhBae8Z9GaYBnGLvqt+ihRCY8p35IdJzoMpqaaPvpThz/
         ABNEdnv/QLJ4EBIgEJJ2LKDBsLV+sVXQfUhZXabtPwqPtkSmDQlRdk9JuR79L7samA8p
         vYhw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta03-20220613 header.b=DphX73wr;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.235.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from b2752.mx.srv.dfn.de (b2752.mx.srv.dfn.de. [194.95.235.60])
        by gmr-mx.google.com with ESMTPS id r18-20020a056402235200b005533f8f54a2si298558eda.4.2024.01.08.03.12.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 03:12:43 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.235.60 as permitted sender) client-ip=194.95.235.60;
Received: from mta03.hs-regensburg.de (mta03.hs-regensburg.de [194.95.104.13])
	by b2752.mx.srv.dfn.de (Postfix) with ESMTPS id 6424E3E03C3;
	Mon,  8 Jan 2024 12:12:42 +0100 (CET)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta03.hs-regensburg.de (Postfix) with ESMTPS id 4T7ry20w2yzxr7;
	Mon,  8 Jan 2024 12:12:42 +0100 (CET)
Received: from [IPV6:2001:638:a01:8068:f8d9:f11a:f164:a35a]
 (2001:638:a01:8013::226) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 8 Jan
 2024 12:12:41 +0100
Message-ID: <f42f3913-11ea-4b78-86cb-ab4fe76db882@oth-regensburg.de>
Date: Mon, 8 Jan 2024 12:12:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: i.MX8MP jailhouse load image stuck at copy_from_user
Content-Language: en-US
To: wheatfox <enkerewpo@gmail.com>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <f81eedab-debe-4d19-954a-06b55f2fa4a9n@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <f81eedab-debe-4d19-954a-06b55f2fa4a9n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::226]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta03-20220613 header.b=DphX73wr;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.235.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Hi,

On 08/01/2024 09:26, wheatfox wrote:
> I'm using OK8MP board with=C2=A0i.MX8MP CPU. I have already started jailh=
ouse=20
> with imx8mp.cell configuration, and the example gic-demo works fine.=20
> However, when I try to start a linux inmate using=20
> imx8mp-linux-demo.cell, the jailhouse's load progress seems stuck.
>=20
> After adding some debug print in jailhouse's python script, firmware=20
> code and kernel module code, I found out that the *copy_from_user* call=
=20
> in *load_image*=C2=A0function (driver/cell.c) doesn't return and halt for=
ever: >
> jailhouse commands:
> ./tools/jailhouse enable ./imx8mp.cell
> ./tools/jailhouse cell linux \
> ./imx8mp-linux-demo.cell \
> ./kernel/Image \
> -i ./kernel/ramdisk.img \

For testing, try to not load the ramdisk. The kernel should at least=20
boot and crash. If that works, we know that there's something odd with=20
the ramdisk.

Second, double and triple check addresses where things get loaded.=20
What's in your non-root cell configuration, and where does the=20
linux-loader try to load stuff? Does that match?

Thanks,
   Ralf

> -d ./kernel/imx8mp-evk-inmate-wheatfox.dtb \
> -c "clk_ignore_unused console=3Dttymxc1,0x30890000,115200=20
> earlycon=3Dec_imx6q,0x30890000,115200"
>=20
> start linux cell output(with the string 'wheatfox' means it's my custom=
=20
> debug print):
> root@OK8MP:/mnt# ./start-linux.sh
> [wheatfox|python] Jailhouse Linux Cell Boot Helper
> [wheatfox|python] linux_loader=3D/m[ =C2=A0129.965933] [wheatfox]=20
> (jailhouse_ioctl) ioctl=3D0x5401 arg=3D281474720244744
> nt/tools/../inmates/tools/arm64/l[ =C2=A0129.975611] [wheatfox]=20
> (jailhouse_ioctl) ioctl=3D0x5401 arg=3D281474720244728
> inux-loader.bin
> [ =C2=A0129.988033] [wheatfox] (jailhouse_ioctl) ioctl=3D0x40100002=20
> arg=3D281474720244800
> [ =C2=A0129.995192] [wheatfox] (jailhouse_ioctl) JAILHOUSE_CELL_CREATE
> [ =C2=A0130.001072] [wheatfox] (jailhouse_cmd_cell_create) start
> [ =C2=A0130.006404] [wheatfox] (jailhouse_cmd_cell_create) copy_from_user=
 done
> [ =C2=A0130.012960] [wheatfox] (jailhouse_cmd_cell_create) copy_from_user=
 done
> [ =C2=A0130.019507] [wheatfox] (jailhouse_cmd_cell_create) cell_id.id =3D=
 -1
> [ =C2=A0130.095151] IRQ 6: no longer affine to CPU2
> [ =C2=A0130.095333] CPU2: shutdown
> [ =C2=A0130.102251] psci: CPU2 killed (polled 0 ms)
> [ =C2=A0130.155283] CPU3: shutdown
> [ =C2=A0130.157999] psci: CPU3 killed (polled 0 ms)
> [wheatfox] in hypercall, code =3D 1, arg1 =3D 2955416576, arg2 =3D 2
> [wheatfox] in hypercall, JAILHOUSE_HC_CELL_CREATE
> Adding virtual PCI device 00:00.0 to cell "linux-inmate-demo"
> Shared memory connection established, peer cells:
>  =C2=A0"imx8mp"
> Adding virtual PCI device 00:01.0 to cell "linux-inmate-demo"
> Shared memory connection established, peer cells:
>  =C2=A0"imx8mp"
> [wheatfox] in resume_cpu, cpu_id =3D 2
> [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
> [wheatfox] in resume_cpu, cpu_id =3D 3
> [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
> Created cell "linux-inmate-demo"
> Page pool usage after cell creation: mem 82/992, remap 144/131072
> [wheatfox] in resume_cpu, cpu_id =3D 0
> [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
> [ =C2=A0130.231800] [wheatfox] (jailhouse_cmd_cell_create) Created cell=
=20
> "linux-inmate-demo"
> [wheatfox|python] cell created,=20
> name=3Db'linux-inmate-demo\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x0=
0\x00\x00\x00'
> [wheatf[ =C2=A0130.249264] [wheatfox] (jailhouse_ioctl) ioctl=3D0x4030000=
3=20
> arg=3D281474720245360
> ox|python] trying to load linux_l[ =C2=A0130.257905] [wheatfox]=20
> (jailhouse_ioctl) JAILHOUSE_CELL_LOAD
> oader.bin into cell, addr=3D0x0
> [ =C2=A0130.266684] [wheatfox] (jailhouse_cmd_cell_load) start
> [ =C2=A0130.274322] [wheatfox] (jailhouse_cmd_cell_load)=20
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
> [ =C2=A0130.342417] [wheatfox] (jailhouse_cmd_cell_load)=20
> jailhouse_call_arg1(JAILHOUSE_HC_CELL_SET_LOADABLE, cell->id) done
> [ =C2=A0130.353079] [wheatfox] (jailhouse_cmd_cell_load)=20
> cell_load.num_preload_images =3D 1
> [ =C2=A0130.360584] [wheatfox] (jailhouse_cmd_cell_load) load_image(cell,=
=20
> image) start, n =3D 1
> [ =C2=A0130.368444] [wheatfox] (load_image) start
> [ =C2=A0130.372468] [wheatfox] (load_image) copy_from_user done
> [ =C2=A0130.377712] [wheatfox] (load_image) image.size =3D 34b0
> [ =C2=A0130.382776] [wheatfox] (load_image) found suitable memory region,=
=20
> mem->virt_start =3D 0, mem->size =3D 10000
> [ =C2=A0130.392280] [wheatfox] (load_image) image load mem region found
> [ =C2=A0130.398228] [wheatfox] (load_image) phys_start =3D fdb00000
> [ =C2=A0130.403653] [wheatfox] (load_image) page_offs =3D 0
> [ =C2=A0130.408373] [wheatfox] (load_image) image_mem =3D 0000000079dd6ce=
3
> [ =C2=A0130.414405] [wheatfox] (load_image) copy_from_user params:
> [ =C2=A0130.419905] [wheatfox] (load_image) to =3D 0000000079dd6ce3
> [ =C2=A0130.425329] [wheatfox] (load_image) from =3D 00000000c239ec71
> [ =C2=A0130.430915] [wheatfox] (load_image) n =3D 34b0
> [ =C2=A0130.435220] [wheatfox] (load_image) copy_from_user start
> [ =C2=A0130.440563] [wheatfox] (load_image) copy_from_user done
> [ =C2=A0130.445822] [wheatfox] (load_image) flush_icache_range done
> [ =C2=A0130.451429] [wheatfox] (jailhouse_cmd_cell_load) load_image(cell,=
=20
> image) done, n =3D 1
> [ =C2=A0130.459186] [wheatfox] (jailhouse_cmd_cell_load) unlock_out done,=
=20
> exiting jailhouse_cmd_cell_load
> [wheatfox|python] linux_loader.bin loaded
> [wheatfox|python] trying to load kernel into cell, addr=3D0xc0280000
> [ =C2=A0130.500262] [wheatfox] (jailhouse_ioctl) ioctl=3D0x40300003=20
> arg=3D281474720245360
> [ =C2=A0130.507454] [wheatfox] (jailhouse_ioctl) JAILHOUSE_CELL_LOAD
> [ =C2=A0130.513165] [wheatfox] (jailhouse_cmd_cell_load) start
> [ =C2=A0130.518321] [wheatfox] (jailhouse_cmd_cell_load)=20
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
> [ =C2=A0130.579626] [wheatfox] (jailhouse_cmd_cell_load)=20
> jailhouse_call_arg1(JAILHOUSE_HC_CELL_SET_LOADABLE, cell->id) done
> [ =C2=A0130.590182] [wheatfox] (jailhouse_cmd_cell_load)=20
> cell_load.num_preload_images =3D 1
> [ =C2=A0130.597678] [wheatfox] (jailhouse_cmd_cell_load) load_image(cell,=
=20
> image) start, n =3D 1
> [ =C2=A0130.605532] [wheatfox] (load_image) start
> [ =C2=A0130.609557] [wheatfox] (load_image) copy_from_user done
> [ =C2=A0130.614795] [wheatfox] (load_image) image.size =3D 1ab7200
> [ =C2=A0130.620131] [wheatfox] (load_image) found suitable memory region,=
=20
> mem->virt_start =3D c0000000, mem->size =3D 3d700000
> [ =C2=A0130.630505] [wheatfox] (load_image) image load mem region found
> [ =C2=A0130.636699] [wheatfox] (load_image) phys_start =3D c0280000
> [ =C2=A0130.642128] [wheatfox] (load_image) page_offs =3D 0
> [ =C2=A0130.646853] [wheatfox] (load_image) image_mem =3D 000000007135b44=
3
> [ =C2=A0130.652883] [wheatfox] (load_image) copy_from_user params:
> [ =C2=A0130.658387] [wheatfox] (load_image) to =3D 000000007135b443
> [ =C2=A0130.663808] [wheatfox] (load_image) from =3D 00000000ebdde5d4
> [ =C2=A0130.669399] [wheatfox] (load_image) n =3D 1ab7200
> [ =C2=A0130.673952] [wheatfox] (load_image) copy_from_user start
>=20
> then nothing happens after this 'copy_from_user start`, the source code i=
s:
> printk("[wheatfox] (load_image) copy_from_user start\n");
> if (copy_from_user(image_mem + page_offs,
> (void __user *)(unsigned long)image.source_address,
> image.size))
> err =3D -EFAULT;
> printk("[wheatfox] (load_image) copy_from_user done\n");
>=20
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/f81eedab-debe-4d19-954a-0=
6b55f2fa4a9n%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/f81eedab-debe-4d19-954a-06b55f2fa4a9n%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/f42f3913-11ea-4b78-86cb-ab4fe76db882%40oth-regensburg.de.
