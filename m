Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBF6D3PTQKGQEMXVF56A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id A4365351CA
	for <lists+jailhouse-dev@lfdr.de>; Tue,  4 Jun 2019 23:24:39 +0200 (CEST)
Received: by mail-wr1-x43d.google.com with SMTP id e6sf7331660wrv.20
        for <lists+jailhouse-dev@lfdr.de>; Tue, 04 Jun 2019 14:24:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559683479; cv=pass;
        d=google.com; s=arc-20160816;
        b=iRq/2KHABR+UfEqD1dCFzvm0xWUDh1vHwcHEo0vocOeY2+np/CKEOR1sBHRTAxsioD
         HuA85VUGu/kvATHQPewED+CLP4PKmrD8uDtJWTRFlqU7dzOubeNiMIIxTjoGkeTvIJ3R
         L1ch/Pu72HpYRxxo6kv9+DlAyXdjWNHJrSrxyVKEpVPu20PdbLA3iNP6ifXaQh1VukyZ
         xnvRzn737dg99VYsR3gwdAkdiGlYiaHS6UWst3s8rKB3SW1g0EmkcQr1PA0wou3Fc5vz
         Ewh3gAMyL+sIdCSSLPVYChcVT3Tf6fREN9zrbmfCEyXCi8ZMUsTFjoUkt4lBG9qRXvYV
         zHXg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:openpgp:from:cc:references:to:subject:sender
         :dkim-signature;
        bh=S4sqiTQ330ck2MbzmmjeLcm05ZVRKWwlviJgGkgcexU=;
        b=K1Al4az9A/LFnqJ7s3hteAlLFrNdSktdjr5Q02Sa/2Eu5a3ChsKXGFQlKfYDt+/Vpi
         uMTri6KraXMRK/nteOwVDXdBNqUt0Kixa3HR+LTOwx4E1wGZjfzR2JkJZGEs2kxZk64M
         bk/ZjFdOru7ZPGutNX2IGM/hG7utJBYUj4/FzIfvLgb5G6/NkpFFLPr6jgmu3x13Pytn
         Zlcrd4SwxaeBqmc6r+10y2t6C5gT3sygkgWs/MjSDiv/psr18TbUNb9tBkbSs2leSNAx
         LFLllgvsDEdWm+dfe2cvRIGRObEYvsTtdgTz/nCZ6qxfRzBIUF/j8WeM9Tpw7W0OrbCA
         AfjA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=u1WzeMGt;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:cc:from:openpgp:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=S4sqiTQ330ck2MbzmmjeLcm05ZVRKWwlviJgGkgcexU=;
        b=quFBPXvH5cba6IplHWFVwy0etWy3zSd3D4oOpA7eaHVk4EHQC8ycFEHLF4EZ51A4US
         msoBTTOQMTdnpsmSS7+C1IPPp9SgHN6xxFKOiSF4jOlGSslKhgWtDMAXtnb23kqsMpLz
         bfP1DBrPK8OVAGUe8AG4TMgajdWtFIds0plGsQaHGJUm1lhOoc7BJx+rkC4CYr8tZreT
         hdHr7logxGUCO280Ps0mFyjqeeY2W2uEunwVOVs4HCwPTbBPgiYYss6ybI4GwRmRmEbx
         M8tp7e94oDN9+1gLkAXxtOw2xBt4/Ba82AHSzMEk6kxG8kaJ3+taXBAg4qjEjYgdfxNP
         LYAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:cc:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=S4sqiTQ330ck2MbzmmjeLcm05ZVRKWwlviJgGkgcexU=;
        b=iC3RIzpOljGc4ZXyFTVgLD1ttCCAMskiyzwO3TT5wJuob2gsuBHjbCYpxLyNE9MZA1
         hKl84DtXmQ0YS5piKJnBenVEzh/W7wZVDlv9eCjWHsY9/0MnI1pveOayvwGLmryRgFTd
         7fLK8KVt486SiuQsw/nOzHeaWGkibLmmqkAaWhMAWTtEPh/22oIbAY8zVH3yl660BbpJ
         Nipit/IRWQ3+ZGRpMyswfU+B8tGEzGUoIZMOjIQVEj7y8HbdHmaL4axXBXmLjnsVh6n8
         U2+ZWr+gexf2HZdbKSVEbXCv/s3pwrbAL5A98Y3bFtO6JRgxWYS72tFKpZ3R4qNF6cdv
         92Ig==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXIC5niR76H/g+BCJWsCHiQ56jecXcpbsAJYszawFr51QC0hrQk
	JeAGN/Z9DQcbj0qwG7abY3k=
X-Google-Smtp-Source: APXvYqwqehFBJMeJHgKcZO1IGkDqIvRQfKY2MFKOMu5LIIssXzFpS4uAzrLgeH5PGe0PQ+pOhXYcLw==
X-Received: by 2002:a5d:4acf:: with SMTP id y15mr7513152wrs.32.1559683479427;
        Tue, 04 Jun 2019 14:24:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:5301:: with SMTP id e1ls4738135wrv.13.gmail; Tue, 04 Jun
 2019 14:24:38 -0700 (PDT)
X-Received: by 2002:adf:b60f:: with SMTP id f15mr23029194wre.283.1559683478873;
        Tue, 04 Jun 2019 14:24:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559683478; cv=none;
        d=google.com; s=arc-20160816;
        b=VeYEKV4phMpFidPoObJ4W9XUn1sMroOGk2TEEYGp67e37TfQMCYbH0dZad8/CEHOmn
         0zFwHlPzpD5ebK9POq12NV13U5P14/Z0znUKfN9zXiqIjwo2lU4DE+eUFJZRNLZDf7Dl
         iuofl41e7od2xG3AiCc65BdCa8uG9P6KutXYo+Q3Z6WQEp4WchGn7Xu5AON//PDJcz2u
         J5m3LqjPIVpHGBmsCWFdX5tgHW94E+RtbNeQahpkYKSBGFN5AfeYAYJsgnbGVD3lz1aO
         Z4/6zh0Q7/CvSeTen/fDqSisGks4oVKGVZs7SJtx7m0G17oyCnygnBAPfT/kibUABcs9
         ZxKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:cc:references:to
         :subject:dkim-signature;
        bh=C1qjFUnLcT3rRmvUASXOB9e4LO/tyWBlKHoNMZpCE9c=;
        b=oyfm7Ftq3eaKMfzE7H+gPF6Zupd3GH7japtBxOqwTF/urNAaK3RJ+/3nyGqc+mnNjH
         vIdXQj2/FV8MRS2Jbu+7xGajjD+4dtwm8NxIJ6gjS+A0nE29hkq5XKh8Gx4ai2w1mL8K
         i7f3nu6yOw330litmchMCLc6m+TiM9vvnQYFS22YW7grU74PCV3Focms2ltD6jLS5LAc
         qJ78Bn/YozcatfRf5GMbGFFqqFju9R7UEyFAKZu3Zg1vhznSt9nWVsGyHjml13hapSSY
         nBxy4Z2K7a5B1iTr3L9YM6B0ItjXH55Y6CRng7V7X4sRZ0m2cISGOjF5RAFhiZd5tY7T
         XEtQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=u1WzeMGt;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id z127si887918wmc.1.2019.06.04.14.24.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jun 2019 14:24:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 45JQ1238tkzyYc;
	Tue,  4 Jun 2019 23:24:38 +0200 (CEST)
Received: from [172.23.3.82] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 4 Jun 2019
 23:24:38 +0200
Subject: Re: [PATCH] x86: amd: fix comment in MSR bitmap
To: Jan Kiszka <jan.kiszka@web.de>, <jailhouse-dev@googlegroups.com>,
	Valentine Sinitsyn <valentine.sinitsyn@gmail.com>
References: <20190510131037.18590-1-ralf.ramsauer@oth-regensburg.de>
 <536d98a0-cb55-1726-3ff3-d7de6d5cea46@web.de>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
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
Message-ID: <45c22944-7a26-547d-9a55-b7703279d0a4@oth-regensburg.de>
Date: Tue, 4 Jun 2019 23:24:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <536d98a0-cb55-1726-3ff3-d7de6d5cea46@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=u1WzeMGt;
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

Hi Valentine,

maybe this somehow got lost -- did you already find time to have a look
on this?

Thanks
  Ralf

On 5/12/19 9:44 AM, Jan Kiszka wrote:
> On 10.05.19 15:10, Ralf Ramsauer wrote:
>> Writes to MSR 0x803 are intercepted, and not reads (as the comment
>> stated).
>>
>> The correctness of the rest of the list was checked with a short helper
>> tool.
>>
>> There's also a read-intercepted area that can be zipped.
>>
>> No functional change.
>>
>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> ---
>> =C2=A0 hypervisor/arch/x86/svm.c | 9 ++-------
>> =C2=A0 1 file changed, 2 insertions(+), 7 deletions(-)
>>
>> diff --git a/hypervisor/arch/x86/svm.c b/hypervisor/arch/x86/svm.c
>> index 9c3e971b..60d236be 100644
>> --- a/hypervisor/arch/x86/svm.c
>> +++ b/hypervisor/arch/x86/svm.c
>> @@ -64,16 +64,11 @@ static u8 __attribute__((aligned(PAGE_SIZE)))
>> msrpm[][0x2000/4] =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x2fc/4 .=
..=C2=A0 0x2ff/4 ] =3D 0x80, /* 0x2ff (w) */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x300/4 .=
..=C2=A0 0x7ff/4 ] =3D 0,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* x2APIC MSRs - =
emulated if not present */
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x800/4 ...=C2=A0 0x=
803/4 ] =3D 0x90, /* 0x802 (r), 0x803 (r) */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x800/4 ...=C2=A0 0x=
803/4 ] =3D 0x90, /* 0x802 (r), 0x803 (w) */
>=20
> Then we rather have a bug here: 0x802 and 0x803 are both read-only
> registers. We
> actually want to intercept 0x803 reads, in order to map them on xAPIC
> reads. And
> writes just simple be allowed as they will cause #GP then.
>=20
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x804/4 .=
..=C2=A0 0x807/4 ] =3D 0,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x808/4 .=
..=C2=A0 0x80b/4 ] =3D 0x93, /* 0x808 (rw), 0x80a (r),
>> 0x80b (w) */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x80c/4 .=
..=C2=A0 0x80f/4 ] =3D 0xc8, /* 0x80d (w), 0x80f (rw) */
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x810/4 ...=C2=A0 0x=
813/4 ] =3D 0x55, /* 0x810 - 0x813 (r) */
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x814/4 ...=C2=A0 0x=
817/4 ] =3D 0x55, /* 0x814 - 0x817 (r) */
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x818/4 ...=C2=A0 0x=
81b/4 ] =3D 0x55, /* 0x818 - 0x81b (r) */
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x81c/4 ...=C2=A0 0x=
81f/4 ] =3D 0x55, /* 0x81c - 0x81f (r) */
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x820/4 ...=C2=A0 0x=
823/4 ] =3D 0x55, /* 0x820 - 0x823 (r) */
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x824/4 ...=C2=A0 0x=
827/4 ] =3D 0x55, /* 0x823 - 0x827 (r) */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x810/4 ...=C2=A0 0x=
827/4 ] =3D 0x55, /* 0x810 - 0x827 (r) */
>=20
> That looks good.
>=20
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x828/4 .=
..=C2=A0 0x82b/4 ] =3D 0x03, /* 0x828 (rw) */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x82c/4 .=
..=C2=A0 0x82f/4 ] =3D 0xc0, /* 0x82f (rw) */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x830/4 .=
..=C2=A0 0x833/4 ] =3D 0xf3, /* 0x830 (rw), 0x832 (rw),
>> 0x833 (rw) */
>>
>=20
> Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/45c22944-7a26-547d-9a55-b7703279d0a4%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
