Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBINSZHUAKGQEVJXZ4BQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BE4555D3
	for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Jun 2019 19:25:54 +0200 (CEST)
Received: by mail-wr1-x43d.google.com with SMTP id s4sf8214569wrn.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Jun 2019 10:25:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561483554; cv=pass;
        d=google.com; s=arc-20160816;
        b=FcatI/hso+H49j1K96eQcn/cB4zE1BqMUKyBNDjvt499P8Ua5Gi+/P3MjCqp6Zsgk7
         N4lKCXwONmZuhX3iISgnnwo7AF/vYf/K5wdHRuDVzTz1MvUPUp9Ky/c0DsVRlC7DmmGa
         MfWvW9HAQpEUGKxECKd2YRRTMA7RdOVzkM+a6KxcZlxFWW7x9fK5MDRvEJqTQavAJ05e
         2wFjY5rHlbOkpAzQPts9JaQhRQClIe/EEZfywg4uBr77gRMy3Frz7YUchjrGqTPus+0P
         m05TrRvSMM9gQE38OHOmSsgOKNf4Aga+kWWdF1rFu0Y7U4YrRGCyWWW2g6pb/73nWOZn
         276A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:openpgp:from:references:to:subject:sender
         :dkim-signature;
        bh=4/MREkmfg8g9KX+uAIrUO47NisIfrJ4JAYQFO1LCtgc=;
        b=QHN7inRzMraFgu+y2zrvjvFl5spuUp9bqCByYbRip/G3itQ/yCneJqH2oMhkIVpYQ1
         CZWOGWsra/C5nA9g+sF4wDUeVNy1LKogO0UheV+UGT/9q0Lt3l7D9JpJd/Lx8KuyMkcl
         qlQPfOglrga32ibssSzbuKU2vr9iHlDRc4M0x2f1nE8jEYrnvHxJZpbPDQgcxcFVYpVm
         Q7KheVGJDIkjkg2KKgRRLQjcH/kImttcNPk5lbMCSykB0TteU5H9Jphc1Qk9libp4UBl
         p/RejsQsAlTKSKlU8L3VEtiXin5frHKb7cICPqFHOcDfD/8gZ+2xTFQsGzjsOGa2I+LY
         FZCQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Ow9Bk1VC;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=4/MREkmfg8g9KX+uAIrUO47NisIfrJ4JAYQFO1LCtgc=;
        b=hdfDLTtNxHvw7chftINhNcPQmDkZi02erhZmVOXWShh6c+FRVyccuH4AE+UHq7Z09W
         uDRWmS8lI5tmXdVM3k7+ADpSxRp0/YtiB5Y1wD8rVfg2aplPsAenz6OwNn1SQBBxY4E+
         FbxoRXyWvrB5ZsPcCvhIG2vhRsOHTELIfFToHEm7Po8HdcKIr3yPei3ijtJekhX0uaSN
         mU31CkDBDIz2JZL9JUR02dg1Jeiiubq3iUPDJiYPI6Skkjs/YhGt/kGGIMqQDgjM7vW/
         JTububeGtVj0c61muOlfFqythI8hdxFO5NdhviSVD3WCtXF2GFtmPaVOYj13LZmlx7XZ
         0M8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4/MREkmfg8g9KX+uAIrUO47NisIfrJ4JAYQFO1LCtgc=;
        b=WGwD2kC5S28pm/gr8ehKjP2K/aze4GGTdPI0nLdOieJ88mAw9NwtVpBUHcw8HkWDLm
         31M74LsIoPC0EsVnWRjYaX3ZKdOfU/k3b8eZYhZfg6m/F6g2glXwx9PM0PsKYGOGpAsF
         XOCughupxxAnYkYkwDlKG2FR9RAZKwubA0md+DCt79sUqXw1c2l1I+Clg5adsxLS221g
         YuEaeZpm8VG8HpxZbH6r5deAuF3XtAvaAvWMXE+aSB1rZl00+j0jeDofaVrstZvJ2qo/
         uWygW/N0k8dbSw6/zWOgaUBO60XYG3TIWs+jGi7TWvLUMLSG9teQ2cVqySlqmmigUPFQ
         6teQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXeVHD0J2hkNXascl8lA0BZL0PCQbpO/CIk3WmMwhGjxmJPlVep
	6Vehmnj2g8KjjLK9d4f28Qs=
X-Google-Smtp-Source: APXvYqzXYbQ0/qQ31aKoBVUNSW0mWp8MRUyXueO3bbN0VOvi5WxKVhLw1ora1oG5N829cHENwJ57ng==
X-Received: by 2002:a05:6000:11c2:: with SMTP id i2mr16385326wrx.199.1561483554146;
        Tue, 25 Jun 2019 10:25:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4d89:: with SMTP id b9ls4929258wru.0.gmail; Tue, 25 Jun
 2019 10:25:53 -0700 (PDT)
X-Received: by 2002:adf:9d4c:: with SMTP id o12mr43702665wre.340.1561483553472;
        Tue, 25 Jun 2019 10:25:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561483553; cv=none;
        d=google.com; s=arc-20160816;
        b=Y+K7ZO7EqaqH1V8XF6YsyxJvMPAf0CG+qkWynavb40EHtVYsm/nTs4hNdlymJuikUs
         qg0f/+T/3W/guKFjzlbmZ2U6TXzAImWXN7IM7gN+MMPA5nV4SzTmSw11CuNHUihXITBe
         w0psS2I/oyf+yqQ3vK/qE5NRFOBK2c2CaYJ5kzeUwS65ZSXH55/Ww6HTuOVQs7eZ8O/K
         MUeQ5ml0mBEVSftu3TljH8Klj/ecl/wmOsCaHG1QH0Z4EXq2L/VDRiWIcVPAXmt7LaC8
         VWKJoyM7sk8k2zde1dELTjUlphvXSb8sb2HLudvqiqBKdE4r1dBJHI8HCWWcjyJAJSlM
         vjhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :subject:dkim-signature;
        bh=M25wFoLmr5Funq36RFNlNxVkRISVfjtRs0o4mmO6WTM=;
        b=DLIlSrawAJ191y06p7ExLlmCmH0FgZGBWTQyMQvWj3OYPXEhPjN1FtI/82vo9yuitx
         6dKZC2KrVmmWU4bUtdLUyBJAWgU/ot2ltDL/vHEEJ72hgcTx33GPwyGE8h2VynwafFKI
         yjZqgXhdYEgA6jWG2QIyimXD5HxQf1WR6Ww//k9fLiwD+mKbOWQPDV5JwkdJEaHWgWsQ
         wN0flsXoM73/BkJeh5oHv90D9DP59wyyIloeBtu04NQ/IwJ4YHdLE2Mcrd5dal0AQMMo
         2zda0PQtzyPN86BX4AwmYXLiYkggQDK6P1kIckVEA8Zdo7EODtoJvlypd7tHRRk9pQtJ
         Dbxw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Ow9Bk1VC;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id d5si1073926wrb.0.2019.06.25.10.25.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Jun 2019 10:25:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 45YCjr6t9jzyBv
	for <jailhouse-dev@googlegroups.com>; Tue, 25 Jun 2019 19:25:52 +0200 (CEST)
Received: from [172.16.2.24] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 25 Jun
 2019 19:25:37 +0200
Subject: Re: Having trouble setting up a shared PCI device in root cell
To: Mario Mintel <mario.mintel@st.oth-regensburg.de>,
	"jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <525b5e1b82474f3eaaecf83b150aa9f7@st.oth-regensburg.de>
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
Message-ID: <bb241636-ed0b-6803-4f34-492744389445@oth-regensburg.de>
Date: Tue, 25 Jun 2019 19:25:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <525b5e1b82474f3eaaecf83b150aa9f7@st.oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Ow9Bk1VC;
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

Hi,

for the completeness sake: it's about ivshmem-net. The PCI device shows
up in the root cell and can be discovered via lspci, but the driver
fails while probing with

[17061.414176] ivshmem-net 0000:00:01.0: enabling device (0000 -> 0002)
[17061.420598] ivshmem-net 0000:00:01.0: invalid IVPosition -1
[17061.426193] ivshmem-net: probe of 0000:00:01.0 failed with error -22

AFAICT, the device is correctly set up in the system configuration.

Thanks
  Ralf


On 6/25/19 6:07 PM, Mario Mintel wrote:
> Hello,
>=20
>=20
> I want to set up a shared PCI device in the root cell but got stuck in
> the process.
>=20
>=20
> I did the following:
>=20
> I=C2=A0reserved a memory region for IVSHMEM and referenced this region in=
 the
> pci_devices.
>=20
> When checking lspci the device shows up but looking at the dmesg=C2=A0the
> probing of the driver failed.
>=20
>=20
> I attached the configuration used, lspci of the device and the dmesg.
>=20
>=20
> I hope you can help me what's going wrong here.
>=20
>=20
> Thanks,
>=20
> Mario
>=20
> --=20
> You received this message because you are subscribed to the Google
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send
> an email to jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/525b5e1b82474f3eaaecf83b1=
50aa9f7%40st.oth-regensburg.de
> <https://groups.google.com/d/msgid/jailhouse-dev/525b5e1b82474f3eaaecf83b=
150aa9f7%40st.oth-regensburg.de?utm_medium=3Demail&utm_source=3Dfooter>.
> For more options, visit https://groups.google.com/d/optout.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/bb241636-ed0b-6803-4f34-492744389445%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
