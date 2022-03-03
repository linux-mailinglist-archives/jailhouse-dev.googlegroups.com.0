Return-Path: <jailhouse-dev+bncBAABBKPKQKIQMGQE4DSDD6Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0D54CBDD2
	for <lists+jailhouse-dev@lfdr.de>; Thu,  3 Mar 2022 13:31:38 +0100 (CET)
Received: by mail-wm1-x33a.google.com with SMTP id l31-20020a05600c1d1f00b00380e3425ba7sf1605391wms.9
        for <lists+jailhouse-dev@lfdr.de>; Thu, 03 Mar 2022 04:31:38 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1646310698; cv=pass;
        d=google.com; s=arc-20160816;
        b=kLbTcUO7B6zOOj73UaOboGSwTborbAnDry958/kM99mxam6ZlLwMLEUanDLHSbP4ls
         XnJ7AvX7kEveikt8WO6xx+zS0a/1DTYm8Q+6hiZjAc2/tLcdROCebpRZmL5hDhcaHLEE
         A0fg7GbBq0Js+ifLs3bgttW3sV2pfo/eB5ZtJ8ndhoCMGPAJ1nDPQAZt6mjWdbCHbu3v
         EDTkFXda/pltKG3nHXASdJPz2p6/D3Mz8i5FJNIY8xzOEcrBX8L0lk6muNfA5URofHGk
         +cCOSziotX3ra2awhkMbUVX7J0ZOcDBvWYbRlCydWQ/sn9o8X1vP2/4LOwA6yoq2fOPA
         0Ceg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=7T8YV01ICOSmBQzi3LeNQifBBkQO3zfaUcCiG2TPvIE=;
        b=ttRP5kIEhoKyj6vUwZW7RKv7azxxXwcFBKmcUnZGeiFPijPqEbcNlArapxzk2Slfnf
         1NIj1o+lGklFbuhW6bbF+cCJeTc1LuNGtZnMMigRCB4gsFPHtMrmCgCQuTdYd33JbQCz
         z53poh1vmjTeJlOtjgVal2DEdNP74ZtFP8eHbNXJzoSF8dnAm79FgrUQqrf0x9SZ1fTl
         KZSmz0aQpm514xHxgjdkuzOxZ9jhLowXiggsgrd1oQHx59YWCAQX0Nhr7VoO/ntP7Qzq
         oTVHuCAlul+g6LbrVQfB7cV0EGIKezSG/gHZXem2MXaboF7rqXOYWLjpzgshjd4i6EOX
         CpTg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=L6cqg6ty;
       spf=pass (google.com: domain of stefan.huber@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=stefan.huber@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7T8YV01ICOSmBQzi3LeNQifBBkQO3zfaUcCiG2TPvIE=;
        b=KoNAxoERZ7szaUPwQEjUc3lHbCh0H7gCVMnLTzhnrH/NCZFzULEgQbA5B6zMJpo/Fp
         4PkO8ogRkiS4lxRN8O+N4XsMdldWTrzS/+V7d0qsNx2h34271/oQBtOYt7IhCL3iYjlc
         astMx3sq96ZqZrhuPVQ8Bxr9vH87awNShZHHclv3Vg553No8sF0ipmY8e6e2v1XJz7xW
         H/f57755S3kM7yuPxlNCz/tgr3yqiytzuCpPIXww7yEu3lQMbSA0pXk5RMxNfHzxNgGr
         dXtWeWIEaLUEp/B8f+jIWVDhmT0AJ3NgTDucfTeyyF0rUS4Pw7jIc5GyjNyI+0CjTNOy
         Wtrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7T8YV01ICOSmBQzi3LeNQifBBkQO3zfaUcCiG2TPvIE=;
        b=ggsrle6egt9FjBCjxBtBM3cdYKgNkY8k4lw3fF70cQtC70JuaIr5C5mi0ar4MbI1f9
         Ge1nY6lMGJWmbqGmOaMpxd9bniHSyBiVWBBTC+LYIAzedQCG9tM1ALEr8EQ3s/ZmxFpS
         KiM8ornMd0InGGsYtAPOjVSQUbFfgxEpzJ7r9XG5zmRlXqUvj/Yi+A7TYBi2CEKxej/8
         UB3OYOZb4bAFEobOvJOcv/pEFVNSFnHZKYK4Uq+484jIffi2sgvfmFAKKDu6SsFRMZt+
         kpnMTdhcMy/CA1zQWeRKzKs23j6hEBdtnItMwEO2pYd4xW97gRjRbQ/VCkUgb57dUh83
         iscQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530uwpTMxF8vuOp9oEfLSwKap/qNRSASnaL5objaRPdpw2peuwMV
	nRHZV8t2t8NtVAAVxeRhvlg=
X-Google-Smtp-Source: ABdhPJwP+GVOyXy0bfdNf7aQzt2d/woa0mWkBiTZU260FDBkPLrLSR6QCsIqFtWEonClW+jwRJKEYQ==
X-Received: by 2002:a05:600c:a47:b0:37c:965:2b6f with SMTP id c7-20020a05600c0a4700b0037c09652b6fmr3595397wmq.31.1646310698200;
        Thu, 03 Mar 2022 04:31:38 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:2bc2:0:b0:386:8897:8f1 with SMTP id r185-20020a1c2bc2000000b00386889708f1ls1624571wmr.2.canary-gmail;
 Thu, 03 Mar 2022 04:31:37 -0800 (PST)
X-Received: by 2002:a05:600c:1d1f:b0:381:4146:bcd9 with SMTP id l31-20020a05600c1d1f00b003814146bcd9mr3575168wms.69.1646310697133;
        Thu, 03 Mar 2022 04:31:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646310697; cv=none;
        d=google.com; s=arc-20160816;
        b=X5cJjMe4jWLXXMxGs2VZQNr6XgLARq0ngiZcwLvZqFuVhw+mBGcEhMi2l3WKOkE5Ar
         +V0HKgJQqPkbCwkwxPVQ8KBLOFWjyFnqb3Q2db3Vj1FezZySlrv0mvfhKodFczueREX1
         52E/KZy3aWQUlkzU7v/YF3E13A8eaovNje9+gjRLXOvSHJv2ZM1zup8MWufhVPBDyzf7
         L6Yam8TEhl5d+5XIhbD7B3vqFovb4/r1f9YrVhlGgSKj2MUzufXiKJwHzYw9wBmSRAN7
         Y7b1gAXKeUc1JejKRCaIdX4oEqT4VGyjj92s0/8Jo+uJnlILsX7CqM8lsbo3zcOzVIMp
         Jakg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=7DIDMdpXZJoTDf7r2X6+tSploBKOn0E1cZU7/uxoW50=;
        b=TBHQruTK0AhsOsAOIobBxWuA2I6lpVOQ8qOVD2XLv5nB3VdH6T4enlGmcQbPu3AuRr
         b6RMbXhnr5R295qoDirjih+ieB6/5lRkMJxDWo5ZCjD6h4vvPPHvTrdgU1ykJ6ytOQMx
         NuPLFdh6Uvr/81cpsTxMBrRvC4mu0sdias8ABn83Og5jLtDL/E+x/zAqxz5KVVtM0tdU
         2/haEfDuzsdA2oE2uhdcy7NdAE9+zQSS20QomrOsvnMYm1NyImvkDei5myid8paYv6XU
         SKdErwJmhXePclV9pgSUFx060fOsMDcc1gXm6vR2yyQ7ioL7b0LeNxJXPIw99WRn3ycz
         MYRw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=L6cqg6ty;
       spf=pass (google.com: domain of stefan.huber@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=stefan.huber@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id h81-20020a1c2154000000b003819dad2a19si594183wmh.2.2022.03.03.04.31.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Mar 2022 04:31:37 -0800 (PST)
Received-SPF: pass (google.com: domain of stefan.huber@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4K8Vj45gHJzy0r;
	Thu,  3 Mar 2022 13:31:36 +0100 (CET)
Received: from [192.168.178.58] (194.95.106.138) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Mar
 2022 13:31:36 +0100
Message-ID: <40f5570a-e545-9968-1c15-972a9fd9b42d@oth-regensburg.de>
Date: Thu, 3 Mar 2022 13:32:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [EXT] Re: [PATCH] README: arm64: disable ITS in qemu cmdline
Content-Language: en-US
To: Jan Kiszka <jan.kiszka@siemens.com>, Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <20220225142929.385616-1-ralf.ramsauer@oth-regensburg.de>
 <33cd5f6b-5735-e8c0-b161-9ced86292b29@siemens.com>
From: Stefan Huber <stefan.huber@oth-regensburg.de>
In-Reply-To: <33cd5f6b-5735-e8c0-b161-9ced86292b29@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: stefan.huber@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=L6cqg6ty;
       spf=pass (google.com: domain of stefan.huber@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=stefan.huber@oth-regensburg.de;
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

On 3/3/22 12:57, Jan Kiszka wrote:
> On 25.02.22 15:29, Ralf Ramsauer wrote:
>> GICv3s in recent QEMU versions have ITS (Interrupt Translation Service)
>> enabled by default, which Linux will make use of. We will crash when
>> trying to re-assigning a CPU back to the root cell, as the root
>> cell's Linux will try to access ITS regions when powering up a CPU.
>>
>> As we don't support ITS in Jailhouse, disable ITS for the moment.
>>
>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> Reported-by: Stefan Huber <stefan.huber@oth-regensburg.de>
>> ---
>>   README.md | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/README.md b/README.md
>> index f1b0cbe3..b5937300 100644
>> --- a/README.md
>> +++ b/README.md
>> @@ -365,7 +365,7 @@ Similarly like x86, Jailhouse can be tried out in a =
completely emulated ARM64
>>   Start the QEMU machine like this:
>>  =20
>>       qemu-system-aarch64 -cpu cortex-a57 -smp 16 -m 1G \
>> -        -machine virt,gic-version=3D3,virtualization=3Don -nographic \
>> +        -machine virt,gic-version=3D3,virtualization=3Don,its=3Doff -no=
graphic \
>>           -netdev user,id=3Dnet -device virtio-net-device,netdev=3Dnet \
>>           -drive file=3DLinuxInstallation.img,format=3Draw|qcow2|...,id=
=3Ddisk,if=3Dnone \
>>           -device virtio-blk-device,drive=3Ddisk \
> Good catch. Is this feature flag understood by the recommended QEMU
> version, or do we need to lift that lower limit along this?

The flag was introduced via commit: ccc11b02792
git describe ccc11b02792: =C2=A0 v2.8.0-1634-gccc11b0279
current README asks for QEMU >=3D v3

>
> Jan
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/40f5570a-e545-9968-1c15-972a9fd9b42d%40oth-regensburg.de.
