Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB36U73UAKGQEVCKD55Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E8160BE5
	for <lists+jailhouse-dev@lfdr.de>; Fri,  5 Jul 2019 21:52:15 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id n13sf2253116wmi.4
        for <lists+jailhouse-dev@lfdr.de>; Fri, 05 Jul 2019 12:52:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562356335; cv=pass;
        d=google.com; s=arc-20160816;
        b=HpVh8819w/u+0jTpHS+4qUmcIu0Th/qOnInrBOWytIXpexnReEI75K7GYWe9GQgT6U
         aof/B+u11nSA1bL0Mmkxn3KAFUsQ58y+oW/HM61RiLiXT0ojr1o8ylpg6b3bDXTVz80i
         NfL8bzMeoPNwIM9rQu4OMUVXyNa5L4Yk6JbCO7jATWVvYIWWoCW2hYGamahS4xzCGnMD
         ZKWpzRvWIcQLzjJF70ZQqyVWEFLNC0bFqQdeh1S/7wRGCOM9Xv8MGOHULnPXfgateN/7
         0crESbblU3xEGjLz6l7ciSiQWEAStIyyDCw+NNYsXAQC44uqAOD5e1aaWDB/qFF636hr
         Acnw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:openpgp:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=yU6jzhJEkcXrDAVeP16q2rUAbPNeybSfFBCO1yQaDlY=;
        b=Ya5TjRAwL5OZx0BxoLRb0uV1BQGkWyJYU9i8Xcx5DFddtOtHps/MmWVdGi9MI2jm8u
         YRcz9g0S6UziNoOS6oeXeDv8ZCjTn8a4HjeDFIAvKLuP/UOMD8XVOP9H/xM9R7M9sqWH
         Lbh/ILfoJ01MlxhZG8kSbH6F2fWnNiHUNLFcf70fJaLMKu2gVy/P8ZC4w8pzs6g/LMqY
         qiPaBG5UMdfhes3/C0YahH8wU7j/Kky2g4FdaRQcnV4oM6z79+xZIauXW9R4w1Vpc9Lf
         P7nvEQLodqSha86NMV3YrVqsmRP3B5+Q1tlpzhvbW7TnhmMbIvx7BD5rq3c0nZdaJW3s
         O6Ww==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="A81L+u9/";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=yU6jzhJEkcXrDAVeP16q2rUAbPNeybSfFBCO1yQaDlY=;
        b=TY3R9hsXQY3lgt+D9I0yb+xbeBYOmPP9fT8nDkKweqvHN/MVOZqBzuEKucIZlvZWZo
         DnHUrPoTDPaHpAWmWaP9k+aP5K2xdXLuNJbbCBk10E7zBXIi6/KK2DydiDRlkQ5Orzaw
         ov/SgmmULHV+sjJMUF8o0Y4e4i3uDolv3zxk4nI1UT3NL6mMcBs4b/k/qbpmEBhca1UW
         nblHa7tAbL+Ovxehqw5N/4u81zFKh6U+ZK/nwcFvXgACYnAel7Wc1A45uvVhiaJTLj0x
         wSxLwQSbkyW8JwLI7HLHB3H7b3WhstrnLfxaV/+kZ3Yg7pwDnZ+DGP0V25LVPxvjdY75
         tRdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yU6jzhJEkcXrDAVeP16q2rUAbPNeybSfFBCO1yQaDlY=;
        b=PjrhzeOoxcnXplOu0Q9GYwg3EbG+WwTj7sF3Lqb8MFdO9UVk5xlimIVvoiC5ic0nhH
         xHWMjkXb8ETSBEq9fRvcAdZNiBNujBPv8tPG4bccDKg3nQKfljs5em5WJ8tRRDXXhcox
         /aNLOkKBnp4E3cGh3tKRzzppKCbdYZmH1GdS57E6KObLezXhGwYtYyeHc/LNBd7VmCQp
         SN+sbF8x5tfc4R9555mJf29fTQyHVntiF3tNm86T2x2aF9wuVMQ1QjMuNti/JNKJJS9/
         MEJJDClh0UukkqSKoaANYe5mMUV/3BljOWwz8wjPqcplFI7PGt5C6z1qNux48BEUk9fx
         cZbA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXGlxVPQtpZe3Ucm1Lchv8D/vDrQSQ4oscXaeff/WKptVNncXIi
	fPuHjMNFeqkry3g/sJ/SgIc=
X-Google-Smtp-Source: APXvYqyD0N7rxw1SbidJZmr1vzwZp5OgtNBS19wragbtfEEwJesu43p40JVGnaYXNA5C74wk9R4TlQ==
X-Received: by 2002:adf:b69a:: with SMTP id j26mr5448533wre.93.1562356335553;
        Fri, 05 Jul 2019 12:52:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fb4f:: with SMTP id c15ls2254924wrs.11.gmail; Fri, 05
 Jul 2019 12:52:14 -0700 (PDT)
X-Received: by 2002:adf:db4f:: with SMTP id f15mr5444452wrj.188.1562356334882;
        Fri, 05 Jul 2019 12:52:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562356334; cv=none;
        d=google.com; s=arc-20160816;
        b=D4RZDsmcv+qvXFKAIu3ob0x31JZ8Q849rIXs9IAov8hBm0Wtv2teMKZ/w7pIxXanG5
         uUN0QeYvhtGIpo+GSaC695dnZq2YU5AKO1N1Xu90ZD19El2BvQ+NmAFCEBa+WedzGLw6
         0w6jaFJdGCQfOfqvJ/9EkO5RyXYI1t6FH3Ughotv2XyYyZen7PDrTC58JbF0hCyH/A4U
         bW9PprpIFrnQ083B14wBUVAodjQ/xnCaWtyRjRjY+ovyYkheTsxk6F7WYdcR0A4v1iZL
         vy/BdV4DgdH61+72MZOX7l34VPDiR7QKkt9VpCT0Yb2XW0rIOjkPeZ4sSOBSx7vaR/Gu
         vqCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:cc:to
         :subject:dkim-signature;
        bh=e/KHtcNRALANJhCfSLrhAS9+aJkUngYF+nW69ap2S00=;
        b=jLE/zkMGoRlLfyl8iXjhIA2nCDk7E1ew7Wni+o9g5SRB1yVwsUc+FgHv8Y29pGysrG
         aqqSFORrAde8+9fqFrcKBADqqAJSZTgG/qmVmCVaWVrVrwcnDiW7JQcAW2xfbIOWaWqn
         Vp0JW2Z3yiBSvOMcVTH+Tjq8w6QBv71WZTpgWQjyh0QsOwM77hYkaIzwqo/EhpWuW6AX
         Qj/8sC/P4oSBJ1H2u4ZFOhL+vpFP1guUDokDYYC7dLu9dQcjTDGRpzAtXMZpcoTvHs4P
         BuW8GyOZ+bgSUxjsqJNeyoT4pDbA4T2a9MR6KT44KkjjI2Cap3zEu8gdRWD3EOGn1kEX
         /n5Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="A81L+u9/";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id u16si456588wrr.0.2019.07.05.12.52.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Jul 2019 12:52:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 45gQV63q57zxnP;
	Fri,  5 Jul 2019 21:52:14 +0200 (CEST)
Received: from [172.23.3.82] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 5 Jul 2019
 21:52:13 +0200
Subject: Re: AMD: non-root linux inmates
To: Jan Kiszka <jan.kiszka@siemens.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
References: <c2839a0f-c1b5-9139-43d5-01139341981a@oth-regensburg.de>
 <814c68a3-d59b-75b6-ce96-411cb8e5f4a6@siemens.com>
 <c28ae172-5eb8-e9d7-b322-36d7016047dc@oth-regensburg.de>
 <445be499-99bc-a739-f6f7-49dc9d8f9b6a@siemens.com>
 <03de53c2-f063-2288-3ae0-c813b53642ac@oth-regensburg.de>
 <12bf6841-413e-58e3-e7ba-0c7a1557bb48@siemens.com>
 <08841e36-df70-50e8-8094-426d72fead52@oth-regensburg.de>
 <36fc6114-d1b6-da9f-f2b6-b76c1f33b7ed@siemens.com>
 <6de58d25-f1d9-b0ea-b0d8-631250e5ddeb@oth-regensburg.de>
 <baa5bc4f-74c4-c60e-0283-a8dcef07b8bf@siemens.com>
 <f2ea45c4-1c22-77cc-a6dc-831aa1e27a3c@oth-regensburg.de>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 mQINBFsT8OUBEADEz1dVva7HkfpQUsAH71/4RzV23kannVpJhTOhy9wLEJclj0cGMvvWFyaw
 9lTRxKfmWgDNThCvNziuPgJdaZ3KMlCuF9QOsW/e2ZKvP5N1GoIperljb3+DW3FFGC8mzCDa
 x6rVeY0MtSa9rdKbWKIwtSOPBgPk7Yg+QkF0gMHyDMjKrNPolnCZjypAIj81MQfG0s6hIwMB
 5LXZPl9WL2NwcBWxU71NBhyTvtVMy6eCPTDIT+rDIaIjdqXUbL8QBzaApxSLAgb7Nbatkx7k
 3LjqflPMmtQfQ67O1qS/ILe5DrYjGbwZWYb2xmXNwJvEENIDou9Wnusxphh1P1acnn+9DIjQ
 9/A+/zCiube3tgCpv5sq8++knQChn2NLMrHlVsRCgGApciO7/0hCvcS9mGE1JM3Nmwfs2wqW
 vG9vhv3uBJHjH4C8s5UCvF/44E22+bBqsrLUlr5d+YRNtY+LCH1rwNIrzNtfZraq0hPiI8pv
 P4GpvHDmrsGTyG9YbD33XiI7DD8IaAtwld7wSkMmt07NRhyxVsPc1ZIBQMyS28VvuLbDK4f6
 WyjQMJmA8EQspEmNcTFG6LnmW+7PGad2Nt7RhHRs4e4JkT8WckWzTCRzlRusyr13SbiFWznt
 +29Q47elnVUG3nB2h1VGZofX+myYJS0uX4BQ2G7sO+LrBY4HXQARAQABtC9SYWxmIFJhbXNh
 dWVyIDxyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPokCVAQTAQgAPhYhBMAttVrc
 MMGXiLwkKnP5TRHIUlLMBQJbE/EnAhsDBQkFo5qABQsJCAcCBhUKCQgLAgQWAgMBAh4BAheA
 AAoJEHP5TRHIUlLMICYQALEBOS5+OegeYvi/8qwcXWTtSPu6/L6z2kgh6XCii8zH8Rn9T1mB
 xzA5h1sBku1wIH+xloRxNNmZlxNyJOML5zMng8cLw/PRTDZ3JdzIFFw7bssAgDiLzr8F0gTq
 bRrAwFCDuZMNCJgJhxRrPRNSrZovqUeaSUAxw10Dea3NgcvJ1SLtClBaU2+U7dHQdBINBLXm
 UAg54P6voe/MhkPEwESRHWKsiEWBp4BBPv8AjXnYAth6F9LZksugF4KZMPWnEgXNjw6ObD6C
 T7qA46/ETXBcxI05lQFs3G9P6YpeOmH1V5pRWb2pS/f9vDudU52QRcAIUir0yjR45tmgJMLV
 oRR7xRyj/BXqBHbzjilg3GDZMiUtfjg6skr++du79b7xnoEgzHR/ByHW67MCbjcuTmpTeXBK
 Iq61He/l2NETfy+2ZnWOUNC7/lZHdfrEyHR3Q3S7TQbkm80TXE05Cfb5NXtZxlbCNxFEMtCT
 UeaUX0NtsHfRDNBzFY6pKSpg8EXDtEFe8+utLekEZ6lFgQ5ZJ1c9NfaOiRJ/NrnQfqAEXUyo
 uILPmXK+3UiFlWtmIIzSQ/Wd+4pJtM291zt0umnxboOZc1mOU9B2wKT3mnA3HxQ1LiRIT9j8
 l8iT6TwRB/aiiXa51hN4R7rfSQMxK6a93EAyUZSoWFpZiBo1/5PynB4zuQINBFsT8OUBEAC9
 HeOKJ/KJ861Q/5C1qwHRK95nJiwCCpASxip68e3ZW9vPTV3VmcQ3tPNRBLPZW1S+IV6DL8/j
 HnopXyyrFBkSJYEAtKkBI5xO6olYglCJqhJ5GdE2WIxvFfTkKwXf3gYc7zuif/5tS7D4XeEH
 wScrncFHCxDSUCXyGM/lnLhu3HfQbK49whpel67uteHrXC4tCMzaTy1SOwlXQi4nufxfARBe
 PT2udi+aZCs4a5bTqvEllPsWRsab4JjTsd831VLYCeRM6siKkzzv9nUjBjTri2cPm0FDS80X
 vQVHEw4bP+V4EvcrarNh/9VmCypuH23qRsAX33mLhB94aBoE6afCkWG5G2m24pj3NCkdA0MG
 IleuuD4/I+6+31Dip53AMvx5EDepMrA2b7gsQOKidgDe1fz/j1qkszmQlxlcb/LruXMWWY7L
 3NcwGUjNRfH0KiSyQ6GMtU5ECu8/o4fecOee76fHTviI6h7jSL3O0AKJadUXekAfhyVS/zUD
 iZTv2zI4wAyxIWj3AFVXXeb1T4UG+k4Ea+M7+jtgGUz/K3/mDYXWWRHkT5CMZLiU8BCdfewg
 Zp94L5KOWDYCeX5LWworOwtkoePd9h5g7L2EBbeINk8Ru018FkEiqALN03vPI8KYNXb6epUg
 xhdvhaPoSD3aCnQttvU8lN70cKBGMwTZYwARAQABiQI8BBgBCAAmFiEEwC21WtwwwZeIvCQq
 c/lNEchSUswFAlsT8OUCGwwFCQWjmoAACgkQc/lNEchSUswevA//RM2YQI1Z3QMBRMr/5As0
 2zXcJFp+j07wkO9avm8U7GwjPjLHGVvs44rTSc0IKSsIKCJDSqNod9jd2iR39lr5/FpRiRk/
 7A1ACZUagASNC+PiyCCjlg34bWulzVmb5ozjqKQqgYww4c6D0P44JDUtedVbKd7HdwjjzP0P
 cubSgAohnXzrkp3gtVg07KeoQyiZctJqJu9Z84MiXMIQ+G75mFkIJEL4WYIkcJ9pamUHX71Y
 T1s6qtrqXemn25w87TioHUMcW4wRXhHHJ4gDbe/P9wb9XKS41ks0kiTia1ZcFsf6QQzoCoK1
 R8ahGzsqvCRHMR7fU5w25qXAPfS5ENZgH0KcAVi1bDjwDyhQk3PfPiraiHmtEz2IlthAPpRD
 Drr0lqCvDFNtqaC+ZI0eOmTvy6/zfVh7ODmaDq1KqMu5EB9ojHXM7N6XXN8OubY+lNx+q0T5
 STssqr8EKkrHp6rw2OQHCX7uaEQri2GEJW4HowVvlashmxC4bxR8B4gbm+EB8gR8PD7BSZQG
 k5NkPOqUZJXq1HO+d5Udk1WdT+mkFGwIMN/U9t3gJNWkab+aAYg1mKwdz7B+10j51vbQbFgY
 2/n9jtl/AFgfYQocbJta5+0fOwIJObNFpLAotvtFNF+Q164Bc3E7Njh230nFduU/9BnmCpOQ
 RncIIYr0LjXAAzY=
Message-ID: <9ee0ffb4-71be-1403-990b-3ef8421aa132@oth-regensburg.de>
Date: Fri, 5 Jul 2019 21:52:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <f2ea45c4-1c22-77cc-a6dc-831aa1e27a3c@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="A81L+u9/";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

[snip]

On 7/5/19 4:16 PM, Ralf Ramsauer wrote:
>>> I found the evil guy. It's inside apic_clear. The last call to the xapi=
c:
>>>
>>> apic.c @ apic_clear
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Finally, reset the =
TPR again and disable the APIC */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 apic_ops.write(APIC_RE=
G_TPR, 0);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 apic_ops.write(APIC_RE=
G_SVR, 0xff);
>>>
>>> Disabling the xAPIC via APIC_REG_SVR will reset LVT0 and others to zero=
.
>> What?!?
> Yep.
>=20
> That's my instrumentation:
>=20
> diff --git a/hypervisor/arch/x86/apic.c b/hypervisor/arch/x86/apic.c
> index 7f51b062..d88ee237 100644
> --- a/hypervisor/arch/x86/apic.c
> +++ b/hypervisor/arch/x86/apic.c
> @@ -340,7 +340,12 @@ void apic_clear(void)
>=20
>         /* Finally, reset the TPR again and disable the APIC */
>         apic_ops.write(APIC_REG_TPR, 0);
> -       apic_ops.write(APIC_REG_SVR, 0xff);
> +
> +       printk("Before disabling: %x\n", apic_ops.read(APIC_REG_LVT0));
> +       apic_ops.write(APIC_REG_SVR, 0xff);
> +       printk("After disabling: %x\n", apic_ops.read(APIC_REG_LVT0));
> +       apic_ops.write(APIC_REG_SVR, APIC_SVR_ENABLE_APIC | 0xff);
> +       printk("After reenabling: %x\n", apic_ops.read(APIC_REG_LVT0));
>  }
>=20
>  static bool apic_valid_ipi_mode(u32 lo_val)
>=20
>=20
> And here is jailhouse output:
>=20
> Created cell "linux-x86-demo"
> Page pool usage after cell creation: mem 280/979, remap 16519/131072
> Cell "linux-x86-demo" can be loaded
> CPU 3 received SIPI, vector 100
> Started cell "linux-x86-demo"
> Before disabling: 10000
> After disabling: 0
> After reenabling: 0
> [...]
>=20
>=20
>> "The ASE bit when set to 0 disables the local APIC temporarily. When the
>> local APIC is disabled, SMI, NMI, INIT, Startup, Remote Read, and LINT
>> interrupts may be accepted; pending interrupts in the ISR and IRR are
>> held, but further fixed, lowest-priority, and ExtInt interrupts are not
>> accepted. All LVT entry mask bits are set and cannot be cleared."
>>
>> If that is not true for your hardware, it does not conform to its own sp=
ec.
> What can I say, it's not the first time that hardware doesn't conform to
> specs.

For the records: I checked this on an old AMD E350. I can't see the bug
there.

  Ralf

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/9ee0ffb4-71be-1403-990b-3ef8421aa132%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
