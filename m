Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBOMN6WWAMGQEHZ47ZQA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BAE8286E7
	for <lists+jailhouse-dev@lfdr.de>; Tue,  9 Jan 2024 14:14:35 +0100 (CET)
Received: by mail-wm1-x33a.google.com with SMTP id 5b1f17b1804b1-40e4caa37f5sf7695305e9.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Jan 2024 05:14:35 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704806074; cv=pass;
        d=google.com; s=arc-20160816;
        b=0XKKkug9Yed+GU+CtFrTHf27f27lgHdGX4KkRIa9GhG6AJyCnGUvU16JcMeANMvcLo
         Fq+UXpFonuTr5NiAkEzVYmY0geBd0w9YhJya1RaqgCmPwUBWSvVkDUDOZjvCtYkhGKUv
         E/AuARw5CsjL1q+D81iDiZtacGp8iFnUBaxB8RUcu6iqCWJnizi9vVvDyFouz/enOQ7u
         xIeMRk/j+56C00Kta39QEGqrBLV5jLpDaaD1IeHVFJJpOmAhuPG0ZAjDqp6uoILLPbiT
         nUu5TYIucWveya7+XnNI1iPPUMBVJ6bkw7KENbsQElL6sk/58ONhdCV7WTluUx1A7PrA
         LGmg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=rFiuSwL7gKJI+PNQ/Ulgh7DcUpVaucT7d2bNuXarwUQ=;
        fh=xV0wa0Mgs5ocIf1n2t9ZgMFJEALBdodouLvqFRUuVHA=;
        b=sayQD8NnRUDpK3fFFA0A9qesaIOisKv+m67qYD56Rmg1Tk9qROQkbu6H+tNQdK2dcs
         3qZpcohOKO6ql3akjEQMdu5tUhxWr+9gkx6QVdHGovIOPb8KP9NcgsKmMGzJA1i+WBJj
         og5j8/2wJke3XsQXg7TlPLQZhELivVFjnYbg4ullExYAgI2HVJBaK5zH43yE82yc0r0Z
         pH6JtwfaJdLIr3yih9cBqohgXiyXCQvG1uQOC/9d/ACCYrXYrL3SmO7u5jWlYHgAtFSF
         aWU5BN9PfPiK0w6Y1dIhsJBIUp9HaTmLUmN3ijcfvSHzqFUj+85tt7iMb4xczRjgKt8C
         3uRg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=djWqBUkF;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c303:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1704806074; x=1705410874; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=rFiuSwL7gKJI+PNQ/Ulgh7DcUpVaucT7d2bNuXarwUQ=;
        b=K+bSPgxDiU6r0DMnqtGhTRK7BjXUxdhKDJIdvFb0jbLJwIq3iXHrBDAMp0/arL5W6c
         KrE+vk9SknilVnY+VoMhxyBp3LSYzv/xas8iv7DbQv4lpQzNfReF8ALi0dfIkQO8mS1W
         UvO5WFan41f+zVC1WtalYCj6fbrWfVtewkPLVXOO29TJ7F2yEVkm6bcn0fOtqxCxuAHd
         gNctqWv2/fIKaIh9AgW7x8hCdCQljKwkT3mh7G6dpNqN280cJtodjvLfhZVVP9bjAZi4
         niGIIe7A1dE+SuroAp81A91wL9MrTL0T+IgvOywCcRjp96zT35kd1p+Cmov9xhrEfaWc
         yKDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704806074; x=1705410874;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rFiuSwL7gKJI+PNQ/Ulgh7DcUpVaucT7d2bNuXarwUQ=;
        b=fEKzc+esIjTT11NjhbCGQNVQYpvEfolQAYHlkjRwmeJipcofwT3tjWpiWd9ze5wBfg
         qIGIdCV4uIa+8IsmSk4aljU8vDJLOOjhs4yh1vZmY85VmdcK/Hps2AESuyzBkAaKNYgU
         efw7QdPRWC9KcunW/xLD77VmXBhwPiC3ZWNUOOvDbY6W5PQj3X9VhE+LjWsHJsCQQOp/
         3LoRtKVgS+hUBE/CWcs3Lk79WJGG7eRw3WLi6xbgV7Gdjfmhxol3OcXaNb1sJYOKc4UF
         TF7BRUzaesaEe6ox2JuWiiqKvI11dv/RO5HTF3nkb0Z8QWdjTdtaEbFumNmR0aR1PyCG
         iUOw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0Ywu9DFYI6FSydblSDO6lD1Fyens6/qCExZ/wSVx4CMRdxdGn9rE
	sfHjLPSd9s2AMMmV6Lvsu7s=
X-Google-Smtp-Source: AGHT+IHnn7ZJJzfIpfD3NAEy3OOzxFW4il97YNk9sGB5j66DeMt2m9mUARmkJ/dqSpwMopW8pNlvgQ==
X-Received: by 2002:a05:600c:a04:b0:40d:7b73:68d0 with SMTP id z4-20020a05600c0a0400b0040d7b7368d0mr2627519wmp.88.1704806073835;
        Tue, 09 Jan 2024 05:14:33 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:3544:b0:40c:6935:2d19 with SMTP id
 i4-20020a05600c354400b0040c69352d19ls2519854wmq.2.-pod-prod-07-eu; Tue, 09
 Jan 2024 05:14:31 -0800 (PST)
X-Received: by 2002:a05:600c:5405:b0:40d:87b7:24c7 with SMTP id he5-20020a05600c540500b0040d87b724c7mr2572413wmb.125.1704806071565;
        Tue, 09 Jan 2024 05:14:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704806071; cv=none;
        d=google.com; s=arc-20160816;
        b=jxTMkj5BjpKdJGI6OmchUJ0MZIqNT1gj4Mm+AaWz+SCOgcSe9pmPVKE1pGqS8B3RAi
         Ca1B7W6MvzsztQ3CdIgmnSzJq6m1jO/IIAIPcfJkXBWj66s287kFdONhleJDB47OXyo5
         p7w6P5AOspvezLUQ+Wc8O3GcysBtGxn0+ydEP8T9s413VRYyhohFmliU/uGp+SahCjNp
         m7pXbZiA1PS15cZujKzrRtEpanPxARTCngehC9xmOYgcYa1NgkyCotLfCQxuI3PqCfZs
         gwNu1bqh0H27YWOyc0t0+9rGMXpiXtB5jPLdadyzz3LJI89QEhpAXtnaE3WIZVNgEXgg
         t/rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Q7R79uM/vY6OzCJ39VIKUtXZl4H2rqQHXTYgUZK/tNk=;
        fh=xV0wa0Mgs5ocIf1n2t9ZgMFJEALBdodouLvqFRUuVHA=;
        b=qGNz1Bvm714Dz3zxnzjA8dMz8BM3RZI75jxp1BD/LWdCDZp6yoB0b8Rn/hL2cKuP+I
         SJ7BzErXb9ptAYslSi18mOtuXAobBYSTh0JMO2Wqm5raIU0T1eSwtt3cpZlyZg0rA/qn
         rz8z5/oXpmJ5mwMsfq9S7SXnSaJwwIybNVJKALt8i5s1mPuXjKufDBWfqgjfRjK9Pwx0
         XGdZ8tKeMZ8p1IzJfWUWuhWg9tPpYH/AB0eD/qGPJHqOl0AZMNONISCu2ZP0HQ99Gei4
         8SzfNlioR5qHvfHwFutdIbelTqi/rWSMnJtOwOKB0kWqUfmvJJlFfEISBLrR3E+h9FXs
         acuQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=djWqBUkF;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c303:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from c2752.mx.srv.dfn.de (c2752.mx.srv.dfn.de. [2001:638:d:c303:acdc:1979:2:f4])
        by gmr-mx.google.com with ESMTPS id p17-20020a05600c469100b0040d91b9a94csi318694wmo.0.2024.01.09.05.14.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 05:14:31 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c303:acdc:1979:2:f4 as permitted sender) client-ip=2001:638:d:c303:acdc:1979:2:f4;
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de [194.95.104.12])
	by c2752.mx.srv.dfn.de (Postfix) with ESMTPS id BC7562A03C2;
	Tue,  9 Jan 2024 14:14:30 +0100 (CET)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4T8Wc63xMXzxrs;
	Tue,  9 Jan 2024 14:14:30 +0100 (CET)
Received: from [IPV6:2001:638:a01:8068:f8d9:f11a:f164:a35a]
 (2001:638:a01:8013::226) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 9 Jan
 2024 14:14:30 +0100
Message-ID: <d36e18a4-dd64-4f9c-b2cf-89b02b1a0469@oth-regensburg.de>
Date: Tue, 9 Jan 2024 14:14:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Unable to start non root linux cell
Content-Language: en-US
To: =?UTF-8?Q?Michele_Pescap=C3=A8?= <mic.pescape@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <824bacc4-b7ae-47c9-878e-7203214b4fc3n@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <824bacc4-b7ae-47c9-878e-7203214b4fc3n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::226]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=djWqBUkF;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:d:c303:acdc:1979:2:f4 as permitted sender)
 smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=oth-regensburg.de
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

On 08/01/2024 23:56, Michele Pescap=C3=A8 wrote:
> Hi all,
>=20
> I have an AMD Ryzen 2600 on a b450 motherboard. My goal is to run two=20
> non root linux cells, however, as of right now, I'm not able to start=20
> any non root linux cells.
> First of all I don't receive an output from the cell (I do get output=20
> from the apic-demo though), therefore I don't really know if they're=20
> even crashing or not; this is the output I get from the hypervisor after=
=20
> enabling the root cell and issuing the following command:
>=20
> sudo jailhouse cell linux configs/x86/linux_guest1.cell=20
> ../buildroot-2023.11/output/images/bzImage -i=20
> ../buildroot-2023.11/output/images/rootfs.cpio

for the first few tries, simply don't load a ramdisk. Try to get the=20
kernel booting. It will crash with "cannot mount rootfs". If we get so=20
far, then you can continue specifying the ramdisk. But first, we have to=20
get that far.

>=20
> Adding PCI device ff:1f.7 to cell "linux-x86-demo"
> Created cell "linux-x86-demo"
> Page pool usage after cell creation: mem 336/32211, remap 16392/131072
> Cell "linux-x86-demo" can be loaded
> CPU 4 received SIPI, vector 100
> CPU 3 received SIPI, vector 100
> Started cell "linux-x86-demo"
>=20
> After this the cell appears to be running in cell list, however I can't=
=20
> seem to get any output to confirm that (I even set=20
> JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE, but nothing appears on the vrtual=
=20
> console accessed via "jailhouse console -f"). I also tried adding -c=20
> "console=3DttyS0,115200".

ttyS0, i.e., x86 Port 0x3f8 is whitelisted in the cell configuration?=20
Actually, your cmdline is correct.

> At this point if I try to disable/shutdown the cell, the system freezes=
=20
> requiring a hard reset.

Okay, is the guest Linux compiled with Jailhouse guest support? Please=20
ensure that non-root Linux is compiled with CONFIG_JAILHOUSE_GUEST and=20
CONFIG_JAILHOUSE_DBCON. The first one is mandatory for x86 Linux guests.

>=20
> Also, there seems to be a mismatch between the PCI bdf value in the log=
=20
> above and the one in the cell's configuration. In both root and non root=
=20
> cells i set .bdf =3D (0x0f << 3) for the IVSHMEM net device and the Root=
=20
> cell correctly reports that ("Adding virtual PCI device 00:0f.0 to cell=
=20
> "RootCell"").

First things first. Let's try to get Linux kicked off before diving into=20
PCI. Comment it out for the moment, let's do that later.

   Ralf

>=20
> If I understood correctly, once the cell works properly I won't need to=
=20
> set the console anymore as I can assign an ip (-c "ip x.x.x.x" in the=20
> cell linux command) and ssh to the cell, right?
>=20
> I attach the root and non root cells' configurations in case they're=20
> needed. I can provide both the root and non root cell's kernel .conf and=
=20
> the buildroot configuration I used if needed.
>=20
> Thank you for your time,
> Michele
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7=
203214b4fc3n%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/d36e18a4-dd64-4f9c-b2cf-89b02b1a0469%40oth-regensburg.de.
