Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBTFYX6NQMGQEGDIHS7A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DD0626AF0
	for <lists+jailhouse-dev@lfdr.de>; Sat, 12 Nov 2022 18:47:58 +0100 (CET)
Received: by mail-lj1-x23e.google.com with SMTP id o19-20020a2e90d3000000b00278fb21e30esf4496ljg.3
        for <lists+jailhouse-dev@lfdr.de>; Sat, 12 Nov 2022 09:47:58 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1668275277; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZcH9IqzWnBvM9JkiPXXqSHVV7BtMOnBHC9lB+bxp4B6Z9bp84N+vFAduV0NRaljE/F
         ySBotpYCA2aK41JB6jH+G/w8tHWYZrk40T0x/vJ2MSb0vfES+pB0ZLpWctTfRvi06yr+
         +2yPaBsKtYpuBGWYohFcMe81ZHq1R7dtSM/jQKf0pz1WPZkNhj0VYmuKkQBz+zKTDgRJ
         VyNSiEeChc+Wlz/HUpVMI5ZruqHmix5VnccFwilDfcurRoQuSdXerL3c+741IDhZYiO3
         Vb89/GbzpBY5TkFbNbOLUn7XGS+ZzushEA37RPv9Zo3wPgCZhpqehfBAB0skQ6EjGLBN
         p42g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:sender:dkim-signature;
        bh=fxtathBPjs2xwWDtEFCsFCi1FoWuEdqhwuKBcHTNgZ4=;
        b=ox/qIxAgE56CVFuuHMWvMy+Ir1GCm/JwWHZkLRXlsS/S6cfGm3TYINtUHllDecNfSK
         LkYwdiPEif+6af3K19s8R41yL2to/jS877y9vPqtkgxlzNL6dyOu9myD9akAMePoRk5l
         D86GWfKKVCeRmFKpG4cxu4B9GMroH9nquZNFXg93XT7yOR/w5jEPRyZEHrJs5yVUX6fv
         bQPXPo8RxsOS8VNfenFGFWky6kvs/lY8FMGchdvvF5Z4c7EPVv9Tt4MCDv9y3HXHXd3k
         KhRiNmOZtoUPXlQDdePLfdE8ei1pz0kuZC1lrxRK365hbD95wNe1zWQsCpsAoujw4sMS
         jfkg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=Tqv0xN0w;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=fxtathBPjs2xwWDtEFCsFCi1FoWuEdqhwuKBcHTNgZ4=;
        b=GFadMNeXUBeIaUjkiaAd5W+wIJltYbYKJ9BlVtktr+pXTUFDKWccnVmGh/v2G/Guau
         +SS8Ksd698E+QF8/+FaKqhy12q6fl++3sn9noTf0eKXBZLe5xI7KEyPm+FJW6AiLaVdu
         v6aZyphzxXuKAq6gVnGkC+bA5lLO4ZcT3Pzf7naw/erO3MxQZvTSEX3pilxghryQzYWW
         3RKzMQM4vKkVYCQskOwaNk8s1zUpokmlGXOgaMgKKxXUddgp/VGowS/TE9OCdBtaiXwK
         kUqoRctb/S43Ebi7Ke5/0yf1He7P0YVKgt1MMdwQwPPBfHK1emjAQgmhmLSLjFdOosp/
         wYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fxtathBPjs2xwWDtEFCsFCi1FoWuEdqhwuKBcHTNgZ4=;
        b=QB7/1YJqryy47rHqM0m3SsKnlcvyLTW6Hv5ADu+nKCSgHQwKpzlzVkXHB9DwB52XbY
         C0FSX/u5Y4P3U8Gus+aYDBSnVU1+NkkkNCpH09p9CbnxjIycnJvauW0ho2VOkI0KEeIu
         p5ipJeczsj0o7I9PUj80KXEo3QbeZHOA29lACWpoHEX4TCc59CnVDC1Rcgt0wNbcKmdE
         NiE20wlfpt4UBZksTz1ItXyeiRiZWQCM789NQMAdmS2rbOJi9Iln/wMI3LaS/dEzMAhR
         XhUIwfgzNrxcsh5QKD0PsO853rBzwlTaWzrVXCUN/GeC8b0mTI63sjrEzuhp7I6loiar
         uhoA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANoB5pllGP1kutfGzomQ6Ps3XCBAAFpElWS41PAEV79aE68rpc0ijnGp
	w3tP/ABIVEIoC1i9ysyBkwI=
X-Google-Smtp-Source: AA0mqf6JnLZL8Mrs2VJZ1huE440tENSqhSmRC0yA3l0b2NhUhB0649ikjlxhVCFSvkhLHMHh9vUBdw==
X-Received: by 2002:a05:6512:258f:b0:4af:ad16:8a08 with SMTP id bf15-20020a056512258f00b004afad168a08mr2246231lfb.664.1668275277314;
        Sat, 12 Nov 2022 09:47:57 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:74e:b0:49a:b814:856d with SMTP id
 c14-20020a056512074e00b0049ab814856dls2386150lfs.1.-pod-prod-gmail; Sat, 12
 Nov 2022 09:47:55 -0800 (PST)
X-Received: by 2002:a05:6512:3f8d:b0:4af:f58e:a7a0 with SMTP id x13-20020a0565123f8d00b004aff58ea7a0mr2204217lfa.507.1668275275264;
        Sat, 12 Nov 2022 09:47:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668275275; cv=none;
        d=google.com; s=arc-20160816;
        b=Y8e5lNAKhbjAokEhP/3MPUxbpaklVxSFKKsMhavLZWPhAIJRt+/6q4umtRPcveqgkm
         GyqSPAksF3ZBCIMoL3olnJ6wD0b0pFsiTYAnmTyKfaG7onqlWpO7VA7mNIv/UZLYp4B8
         ZLw9N5/QQPyhf8iwOwJD4OgDWTe0DlLS/aQO3+IkCn/wQvSV2jZc0/tr58lDaAtrnF3o
         1qp+4pgnjogN+T2yLfjQqT4db4y4cnVISsH1lorkwwNJ9ZkY3VjR5rHJayqHxprby6Mn
         hwoUIxLHXP4q0Nq9k6aE/MXULJhFRW+H29WENZSDkzcQIYamdvwm8HoQvDZLPwNv4uki
         7LmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=L2/kfThSYNnu1FIl3Oe4QBFbhvzt3VCvMgyFl6rFH7Y=;
        b=G+zta7ldlOWVLoLwSsF01/q8iYfbO0A0yKR52G8Qjh8fvoD7B5ozCTtCEW7bO9UK1T
         VZXBOs/U8hasReZbT8cal7nCMOjhpdBD7Ci0trr+D021oZqj+CIgqisKFk9kEtdytGE9
         pMUwskPPV8alYUsNw/o0FdB3N5GuQr9sXFhlMVqZfRmmXK6HxonevtU0AeyCNhb1Vh3Y
         SsGEU54yJRZmOCxrf03DqiH4ipHIZNJIe5Di0f4BZ1iUt0BxKZGzbHpG9j+hX1/u4TTO
         tO8s4drNf8xxQ1p1KbRKgaFBAYvl0Vdv0a4pbi5YpZE/EfTga18y61Tp5F9WLTlDvDeP
         sAHw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=Tqv0xN0w;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id h4-20020a2ea484000000b002772c42c043si212115lji.5.2022.11.12.09.47.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 09:47:55 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4N8jhp2Nsrzxrr;
	Sat, 12 Nov 2022 18:47:54 +0100 (CET)
Received: from [IPV6:2a02:8388:7c6:9e80:bb58:d20:224e:9588]
 (2001:638:a01:8013::226) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Sat, 12 Nov
 2022 18:47:53 +0100
Message-ID: <63d52496-ac3e-8dfd-112f-8e723d0af98a@oth-regensburg.de>
Date: Sat, 12 Nov 2022 18:47:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Jailhouse: enter_hypervisor returns -ENOMEM
Content-Language: en-US
To: Karim Manaouil <Karim.Manaouil@ed.ac.uk>, "jan.kiszka@siemens.com"
	<jan.kiszka@siemens.com>
CC: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <AM0PR05MB6018F1663ABE61DA3C697CA4A9039@AM0PR05MB6018.eurprd05.prod.outlook.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <AM0PR05MB6018F1663ABE61DA3C697CA4A9039@AM0PR05MB6018.eurprd05.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::226]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=Tqv0xN0w;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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



On 12/11/2022 18:15, Karim Manaouil wrote:
> Hi Jan,
>=20
> I am trying to deploy Jailhouse on an AMD EPYC with 128 CPUs (8 NUMA=20
> nodes), running Linux kernel v5.10 (same version used by jailhouse CI=20
> with same patches applied).
>=20
> `jailhouse hardware check` return that everything is ok and that "Check=
=20
> passed!".
>=20
> Memory was reserved via `memmap=3D0x5200000$0x3a000000`
>=20
> However, enter_hypervisor() [1] fails when entry() is called on every=20
> cpu and return -ENOMEM as error_code.

Try to reserve more memory. Maybe the default size of 6MiB for HV memory=20
is insufficient for 128 CPUs.

Did you use jailhouse-config-create? You can use the --mem-hv option to=20
increate the memory. Try, for example, 32MiB and see if it works.

   Ralf

>=20
> Do you possibly know where could the issue come from?
>=20
> Best
> Karim
>=20
> [1]=20
> https://github.com/siemens/jailhouse/blob/c7a1b6971ac15e4be8a0918b9bef6e2=
cbd99f9fc/driver/main.c#L251 <https://github.com/siemens/jailhouse/blob/c7a=
1b6971ac15e4be8a0918b9bef6e2cbd99f9fc/driver/main.c#L251>
>=20
> The University of Edinburgh is a charitable body, registered in=20
> Scotland, with registration number SC005336. Is e buidheann carthannais=
=20
> a th=E2=80=99 ann an Oilthigh Dh=C3=B9n =C3=88ideann, cl=C3=A0raichte an =
Alba, =C3=A0ireamh cl=C3=A0raidh=20
> SC005336.
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663ABE61DA=
3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com <https://groups.goo=
gle.com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663ABE61DA3C697CA4A9039%40AM0P=
R05MB6018.eurprd05.prod.outlook.com?utm_medium=3Demail&utm_source=3Dfooter>=
.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/63d52496-ac3e-8dfd-112f-8e723d0af98a%40oth-regensburg.de.
