Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBVXV3T4QKGQEMR5AZHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A18245058
	for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Aug 2020 03:31:03 +0200 (CEST)
Received: by mail-wr1-x43c.google.com with SMTP id z12sf3966982wrl.16
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Aug 2020 18:31:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597455063; cv=pass;
        d=google.com; s=arc-20160816;
        b=Gmb5GlJlJ1ALs4Xmjd7AAiuZwa2rExMYKHcOygMMEd2OIVVHKAnCEevsBMA7Uv7/I7
         QGoO8Yxe67ZgYznLXNrmaYd/IZ/hbSmnJbzHQ4TkYt4EOhiIINP9BcR8sc9VkWY/tTFG
         mheXdl2PT0OhKtPux8F5OZAmufnPY/AvOxDKDAjyGHKED6t+Nfs6Fbyl/9FJeL0pHOSq
         sAOF7A/JKePrqhzxaM2jTVoCrhrGLkWezp7y6EqOVI3o/f8AJ35+PIDb12hIvUAwpe6T
         YRAYOmaSUmXo2EE+494JnK5TJ7x20E7yiF5jZ2o5atlQAAT65HrgIH46SwqbMk3vO3/k
         RYJg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:subject:autocrypt:from
         :references:cc:to:sender:dkim-signature;
        bh=3VU3h7eSzUaMIRfMrAmJTrxDiyx1VEnutG8HjSPcvWw=;
        b=OJAB75rBLGnLChkkrjWpA2Mbuk7EWq+HAcq6cVys6u4MIb1bYDG0Z/QOp1pO/JH8VQ
         tRCX4vOy8i1lRhsFf3BvsPaeJTmBGBl+vGXFKI1aP6KJYSnr5KrnnNXM/Hdufxa/F/xz
         JKw5D25AM2vtat9mOnecZp8vcWsbM09dOmfy/1O5eH76QXYQdmVqKfl/otYWkF8sgrC9
         /uz81MizXBCnwv/9ar37j0eaojbm1WyDSgsn+THL15Zqt08JLz8poFvLhckSO6Tjth3F
         T0roQnPLx/bGqYAvXgir4TlnKvIY9ZvZh3+y6NxFBr3Fe4D6acu2RSeIYXrdq/N466gg
         kiog==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=OwpMURo3;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:cc:references:from:autocrypt:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3VU3h7eSzUaMIRfMrAmJTrxDiyx1VEnutG8HjSPcvWw=;
        b=PprhdcvJ04CiyJ27zUhv7nedwLauCBT81zefe2VMW1PAzh8MzNju5Z15JTaYgP3KOR
         ImbOpszFSDXSxgNjnYtt7x/cblO+sA2kj2VOF4RhZkJhxQGEdWg7KvhVl/CsrVqfMRrL
         qPM5+/mfJC0gzC8otR7lhvhkQKH1qfQONgdxUSWbDjYlobqOgyVgh9yp5a31ZI+trj2l
         RKTSoz2xQgP0ske/wP9RHGpsn7Pj5GZV/0Mu8bqP1VXBnQaTeafc9aytzlF1m0s+S4Hy
         r9oZH6H+6sUfFuw8mGNIank+ecRD3sKtiOdTBxPC4iSSx6ZTYMoul6KQYO5aRQYmCRFS
         Pv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:cc:references:from:autocrypt:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3VU3h7eSzUaMIRfMrAmJTrxDiyx1VEnutG8HjSPcvWw=;
        b=Aw3xbf6dpKnWjZlOEor92JenPIa+gxclXVYat1f6Cgg0bekKeYQ89RQRZpSVOYW3Mb
         qijLkp4lU1td4+6Q6L/vAnnZZPmOeSBqBs76xSz6voxaxWLqpMWNF/remcoZWoM1c+6W
         BWFP/QVxnno2wb7VPzlHxZlJKwDoq/LaL/efRPpArefNfTmBdoEDBl72xLLVk2ksn+Zu
         mx6n6a2fFJ1N42UQ90c/NJPzfnR7EL1yQ6ihfjyOOO/NHV8lDUJGRjriF+rYcxX/qsLA
         +Fk34E6/CifGnQt01eARzRp8HM1kq7WZiTdMazmxl13sNvJgP9qef+TJJrVUCwA+dCCO
         Pq9Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530x2106qUQJyv5Gbm8Th446xtK616dhgBYuQX4BhzI4BEPkN+q0
	NBvawLzlhBTuy871J65hGXY=
X-Google-Smtp-Source: ABdhPJwTz2eVYIGzU37RhhSSLi7Kla5DvVb/dF5a2A4UEpZiJVIe9E9qTChL4NzlpHRliDKuA86qXw==
X-Received: by 2002:a7b:c95a:: with SMTP id i26mr4948809wml.106.1597455062974;
        Fri, 14 Aug 2020 18:31:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c304:: with SMTP id k4ls4861000wmj.1.gmail; Fri, 14 Aug
 2020 18:31:02 -0700 (PDT)
X-Received: by 2002:a1c:1b41:: with SMTP id b62mr4716048wmb.89.1597455062313;
        Fri, 14 Aug 2020 18:31:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597455062; cv=none;
        d=google.com; s=arc-20160816;
        b=ptWmFTmHAh7/smaHr33nsbwp44xznKg6rpbd6oXX0mceNSGlEb51tqwOCFfAmN6z+g
         NZO9FgMje3PFjEFuHGFXEMT/ExIg4TiEWX7/hS8yAPvMWMcJHa9Xn5EghKeBxC/RbN+g
         nJ95FAyKA7EHV++vmdJP0jhccJp1hG3i5eT4yLWg4KLWy3O6ILtOJajGnpSnEH7CtE9c
         5nbSMRJX+V3+13rprhP5tpQKQ8HPD9UN/l2IVSQ/C0H9Z3lKWErZ8clKN9xQ77hZ3k/j
         ao2cDY5XYiC3+AAns02WccWQkjlJMWuoRs8OZu2xyPqmMqXmcj4ZdUxWpP66JwC0iozJ
         rvzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:subject:autocrypt:from:references:cc:to
         :dkim-signature;
        bh=EAkfeorHkW5+/UkFQdZsEhF4+VBl8Yy9V+fpOikyvEk=;
        b=Mlbw488NqQZ098lPTbn2hg4zHvnK9JwBX94DgPl4uyj3YIcZ3dwxt/BqzXosqpnfXb
         3X+w+W1SGhWbzMjwBIQSs4SttfgjRyvVBt9EAhWEQ8gqUBw6y9esxHbYSZeQlePflkLj
         FQWyt1Z/j1Q4PbkIViHzSZg2FXkkeiZYWhe9h4pBUI8vRWXspoE8bIf8h4exO8RVTPmO
         kVUw+Oq6b+sjVWYhzxZKDdNPGZCOXR9euJgzCOTK6Ieqto/WPV3M2blakg80M5nJcLzx
         2wZY95rSOFMlrOwb75vuaHTVpV8T4Gc8nXhpyiJIVaGuXCcGTk9hmGdcEugzwdgs4jpf
         IZNA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=OwpMURo3;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id i17si301243wrw.4.2020.08.14.18.31.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Aug 2020 18:31:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4BT2nd5yMmzyD0;
	Sat, 15 Aug 2020 03:31:01 +0200 (CEST)
Received: from [IPv6:2a02:8388:7c3:300:4e34:88ff:fe05:eed9]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Sat, 15 Aug
 2020 03:31:01 +0200
To: Jan Kiszka <jan.kiszka@siemens.com>, Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>, Peng Fan <peng.fan@nxp.com>
CC: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>, Alice
 Guo <alice.guo@nxp.com>, Wolfgang Mauerer
	<wolfgang.mauerer@oth-regensburg.de>
References: <20200807030632.28259-1-peng.fan@nxp.com>
 <20200807030632.28259-7-peng.fan@nxp.com>
 <4bfbd74f-843e-c3b9-47c7-31100d085052@siemens.com>
 <DB6PR0402MB2760040A34FE70576005395E88400@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <deb41f1a-1b87-ebd1-50d2-d7d299d35d8e@siemens.com>
 <9e8f00b4-2a2d-8bb8-e92c-8e23e5910af0@oth-regensburg.de>
 <5cd1415a-f4d0-b307-e81a-769b7be8eebb@siemens.com>
 <f81327a9-db37-be4d-4aa3-862b7d0416f3@oth-regensburg.de>
 <47babf84-565b-db76-7e42-47b0a2d5ed00@siemens.com>
 <9d551e5e-25fb-4c8f-66a4-934187b9650f@oth-regensburg.de>
 <4f2c2e19-eba7-6020-5f1c-137f9e8c5efe@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
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
Subject: Dropping code during runtime (was: Re: [PATCH 06/10] Add
 libbaremetal)
Message-ID: <314fbb96-7032-ee8f-8926-de3a667bddee@oth-regensburg.de>
Date: Sat, 15 Aug 2020 03:31:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <4f2c2e19-eba7-6020-5f1c-137f9e8c5efe@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US-large
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=OwpMURo3;
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

On 8/14/20 8:13 PM, Jan Kiszka wrote:
>>
>> If we have a universal binary, there will be a jailhouse disable will be
>> present in the beginning. Once we decide freeze the configuration, drop
>> it. If we make those things compile-time configurable, then it has
>> potential to become a variant hell.
> 
> Dropping significant code chunks from a root-less jailhouse.bin would be
> a valuable reason for such a config variant. You do not have to argue
> over things that are provably not there.

With my approach, things are (provably) not there in the operative
phase. It depends when you want to attest your system. In the same way,
you could also argue that Linux, U-boot, the firmware, whatever has been
there before you made your attest.

What are the parts you could drop during compile time?
For system partitioning / cell creation, you definitely need to execute
the code at least once - you can not drop it during compile time.

But after execution, you can drop it. In the same way, you can drop
init_early, ... and others. The only part that you could drop during
compile time would probably be the whole disabling logic.


Let me try to show what I had in mind:

https://github.com/lfd/jailhouse/tree/detention/rfc

That's a very early hack of what I was thinking about. The idea is as
follows: Simply lock access to the hypercall subsystem, after the new
detention hypercall was issued. With this, we can remove everything,
that is only reachable from the interface. Runs on Qemu.

For the Intel version of the hypervisor, before that patch, the .text
section contained 48182 bytes, with that patch, 40616 byte remain in
.text, the rest can be dropped. 16% less assembly, and I'm sure we can
find way more routines that can be annotated: init stuff, pagers, ...

Ah by the way, what I realised during my experiments: The .text section
of Jailhouse is RW mapped. I wondered that I didn't receive an exception
when I tried to overwrite code. Is that intended?

  Ralf

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/314fbb96-7032-ee8f-8926-de3a667bddee%40oth-regensburg.de.
