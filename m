Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBSES2XUQKGQERNFCOYA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DB16F8DA
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Jul 2019 07:27:37 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id m2sf8200543ljj.0
        for <lists+jailhouse-dev@lfdr.de>; Sun, 21 Jul 2019 22:27:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563773257; cv=pass;
        d=google.com; s=arc-20160816;
        b=UZmIXzRSgjJ5E4uEtjeIbmCvpMGCRgjS9Jbt2XNofSs1dvYwDk5j4lPiyn6OHuIAAB
         Z5X1ojy5LGNi5d2Y6ZynxUcRD2H2tEAsAytx95q2aHyup5XMMG/xRRNiCHWDWVdedgX2
         mq7Ghi9cKWEItntRZudLVEINMc+Jg9Pyp8mEu3gZhly4MakOdZJZv+qeg/uLO81bW3fw
         MvXoHE3F1qdi5A4nvUnA3B8QXOVvmhYwD5g5Jr5spvCtNq/2COHTTfC/rR5ybQQvaZWZ
         +VFbiLcVLgVj+MxRbvm6E55keh9NattAWYfX9VRQzhXsaWPEUtMa/QgpwUK42MaaCdiw
         aGdw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=YSasYgsXUNOxlxMfliGglhz+20E1LYigzW6r6xq9+7g=;
        b=K7wcVdumEO1pejfAg+02XbN97zWl8ROYpnoqHwb9fWcwwMXJYlg057gPbAE5MOzWry
         uJLJv9iz4O/8fSs8TylnjkjEwFRgZ6N5NhEPwb+2vrvp9jH/AuEKJ285ovSrnKcL29iK
         c87JpjM7HAM31ZKOoSVdhqZJsjKuTusneg1lKJcuWQs+xH0KvAN0tzyLPPaqwyrmFoZr
         TT43pxw3Jg/eyzNaOyuVPeXaOi91suZtW9C7WlapG3XW7XsDLPxlw+360+lSwt/vbG9c
         2F7tEKECL7Iwg6HDo6duXLjMB2WnvK6tFZt4P4veZl9oc7s7doQZ+zWjDjN44gnprBJ/
         SKng==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YSasYgsXUNOxlxMfliGglhz+20E1LYigzW6r6xq9+7g=;
        b=XMuX4JNl+oesJizHZRbDwjNcqxidkVfTPTBqmiDtqnY9XuenI+ZXvr4Zwdsao2G/3L
         YimqAfXPwcW6xjmJ2SZjY2mukpclm6RxNChM4IV7R+qsv5XMJeQMAuJRK6m7kQBK11tG
         1faVSPOKA78CAuMF8kggtTnhZF/ThwTt6/zSnFRNv00IucG2udR9cEqZH4vahWvCE/yn
         RMxXfWIUBWDAzBaaBIsbEgXB+k5XBEAbwXXJX/i29AdVTIWIVwRzEoW55M6FPHk9eeIE
         YeXWeyIWYZLskCbfbCp3FWJuDvz5C9f47a2DWdA+BMW7qSJnIAim5TT5uXxELAqPq8/v
         kzZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YSasYgsXUNOxlxMfliGglhz+20E1LYigzW6r6xq9+7g=;
        b=ZuQAWhooDEFsjGV70HhF7CGixXvwwpyzgvvmbA0vIXjs3kTFIh4FIRW8RJr6tPTJMf
         GUXVYXz/0lJdjgpZW8Rw1WqhT9nuWV3axEucL4LAY/IK4ytP4VwH6qyG89nPknhXebxu
         g2PXYXVVeUJhuNneCFMTxNDRqins2ZN0m9j586IvdgxF4q6GWbBAVnfRRc43BMoIpGMd
         4feIMhQZcLt72wWTd5HmI4RrkDFm7/Pw9BdQMSXaPtOl+tYxyowwWKTYaBQARkNrbjDP
         MKFPFjr9HK0OQz4qWXPCzWC6yVUN3DHLailrRDlO3jV877nThkqvh7pE8ukzQwssx08v
         jNJA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXMn6ZCSFxjMDDyMx0hLGs0n6eYGUW5MLbj08TrKmEvMEZ5uilk
	LVFc9GYNHlFc5kq+Ro4ICCw=
X-Google-Smtp-Source: APXvYqzubMn3DyRnd8s+t+cM90S2Cp+Mh9nGraDxOsjxoYwaKTjxOZWeMcGxrUeR5l3ytg4TZVe/Wg==
X-Received: by 2002:a2e:2b01:: with SMTP id q1mr34368318lje.27.1563773256899;
        Sun, 21 Jul 2019 22:27:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:65da:: with SMTP id e87ls4294726ljf.1.gmail; Sun, 21 Jul
 2019 22:27:35 -0700 (PDT)
X-Received: by 2002:a2e:6e0c:: with SMTP id j12mr34864314ljc.123.1563773255277;
        Sun, 21 Jul 2019 22:27:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563773255; cv=none;
        d=google.com; s=arc-20160816;
        b=lkZ5VgtW7fDsDXZtKAVCwAOBdMIurt5s9G6Hle1G2Si5sMFlmsAZQQntD8Kwovo4yS
         C6KtQyA+cJ1dDYX3a7kUd7JhjgpZUOv5XlYhd+Mf4t7+shyntno0isNe9PwpPOqwyWS/
         AUyCMw8rzA9l5ssiGnqXbUDk0nXr6uQbVI8cwcC1TJDcoiJdl/iqfzj41Bt1L9RKf3wP
         mSfXXnhI0iVkMb6nHsSPdYRZ/0UjmKIwArRxgyROi3GE578zbV2ulTUVhbj+Yfs+Uy7S
         ALMIenpTH5z9jfvq6mCWX9VHStFe7TV+0HSYNJmQM/KDBWKKHJHtrpCqOKJgr/+RaS8w
         ryPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=WsAF2jIkLJ7xGybSq2g+BlIVAb/uhFIzEiAq+jNbyTo=;
        b=tINcA6HXorut4XeaI2U6+Y5QvVsU1yBvBqMzOOqjXh8BBmgaKJLf7CKx9yOl0IhQ7x
         H+gTAS+MwI6LmaMja4FvU5a0XZt3r3Z2OrCNazzJTlb/L/5zVWIEkQxsWFQfqiRJ4D1f
         Tl7j0YmHIgKWBZxUOINQsAG+nGU5yfJcTxfHFuZ9nbKJZT4a0exxnwCF1FzChHUO+ATn
         QK1utbpi1P/VPacBqI3l269nGqvcqRbRP4vV4bJcA9jstGhZPQTFwgrs9CgNc3H2277p
         doaYVpPNIjEtmEVBqQhmo98TL8Th6izXlhx6d3KxUATTDIZiD6TN7DlsZomCg5WvWTPs
         FwsA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id q25si1871188lfp.0.2019.07.21.22.27.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 21 Jul 2019 22:27:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x6M5RX12012928
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Jul 2019 07:27:33 +0200
Received: from [167.87.0.229] ([167.87.0.229])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x6M5RXS9024733;
	Mon, 22 Jul 2019 07:27:33 +0200
Subject: Re: JAILHOUSE_ENABLE: invalid argument error
To: =?UTF-8?Q?Jo=c3=a3o_Reis?= <jpagsreis@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <a8a5bcdc-c3b7-459b-9116-fd4a04f2f02a@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <03e07418-13ad-82ea-20fa-140edcc28bff@siemens.com>
Date: Mon, 22 Jul 2019 07:27:33 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <a8a5bcdc-c3b7-459b-9116-fd4a04f2f02a@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 20.07.19 19:19, Jo=C3=A3o Reis wrote:
> Hello,
>=20
> I am trying to use coloring on my board, using branch wip/coloring, but w=
hen i
> issue "jailhouse enable root_cell.cell", the console outputs "JAILHOUSE_E=
NABLE:
> invalid argument".
>=20
> I've modified drivers/main.c to printk some steps, and i've noticied that=
 the
> jailhouse.ko generated from wip/coloring branch doesn't get the right val=
ue
> for=C2=A0config_header.root_cell.cpu_set_size on=C2=A0jailhouse_cmd_enabl=
e() function.
> The value for config_header.root_cell.cpu_set_size should be 8 bytes (it =
comes
> from root cell config file) but somehow it reads 0 bytes.
>=20
> root cell config file.c
>=20
>     ....
>     __u64 cpus[1];
>     ...
>     .cpu_set_size =3D sizeof(config.cpus);
>     ...
>=20
>=20
>=20
> When i use the master branch, within jailhouse_cmd_enable(), it reads cor=
rectly
> 8 bytes from config_header.root_cell.cpu_set_size, but with wip/coloring =
branch,
> it reads 0 bytes from the same config file.
>=20

Maybe some inconsistency in the build? I'm checking back with the folks for=
 who
I created that branch for testing purposes (we are still awaiting a rework =
from
the authors), if it was working fine for them.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/03e07418-13ad-82ea-20fa-140edcc28bff%40siemens.com.
