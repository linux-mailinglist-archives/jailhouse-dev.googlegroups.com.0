Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBMNAZDUAKGQE4R46L6A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E5C54E8F
	for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Jun 2019 14:14:41 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id b67sf771751wmd.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Jun 2019 05:14:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561464881; cv=pass;
        d=google.com; s=arc-20160816;
        b=kuvpj7xqcehwbLJtExZPQeOelIhy+WFK6TmuNGt0AjZVAI4Sm/7fIsgYqSU2I289Sk
         LpaPXAwjDs0l5ArWqdeijx2kx2z903R3bOoYA4UY1113fVwoZO80yAvCZlu+nyCdt0Gu
         6/6pxcNfgjCg94O3SYaciydqY2mQLCf0NDmZ9ojfNDzlA6W3tXKZY3YaB7u6EsiW8X2c
         zvNbQ+qQ4rMV+7yHsd9ZZVA6kWty5SvU/QsEMA+O3HuDON13KmHnxSB4YweVzXaIdB2Z
         ZB17S1aWHL1L2sBM2vhEXmEuwc9jB8iVo379zTP5x38t2gJTo98UC0/6kzIMpSajglWy
         LRKA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:subject:sender:dkim-signature;
        bh=T43aVQzPiT0XjV9pueFSbLz7BuhEixxnvnl5P/7wszk=;
        b=J69s52f1t8LeP4FGza2jLVGOFrH4FHtqlLz4iGgARFcmBZ71zo7IFuYUWkBRmMSLkf
         okaf7KKtrovk94h2IrggjiV0YCQgBZYMjmBb0V+/BmUZ6yQcSA4/u1g+ghsLqrFY7Qfn
         e2BdpBS8H09FZ8xlzZslnblJUzq4cbcEaQRZlLIXx6m0jpbYdWEMXecbz9rJPPNOyyc1
         WbuSW+ONxszTTtedbkBBRV4RPbdd/o9Pqxh7203TyLVswL5NEOzQSB8xE5/NB0GcQWuN
         0gck4SL14ohsdYzGe2/vqj+vbW8megDsVQ+aRn1Taj7NozguT4Yrpx32WX+6H/lohagq
         PDmg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=rZPgTmt+;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=T43aVQzPiT0XjV9pueFSbLz7BuhEixxnvnl5P/7wszk=;
        b=IkrccvuCP3TMP/5yI1aGkJ3ovQsPxgYG22mPA5ZbzNEtxo6TZ5DHT6pxzQOuHetI3X
         g+O1AEFxCNruQyYa3fZcm48Hyq9swSmjavKb26sMtDqqZVHwDHbV4fUV5ffD6Pwp3NzN
         JCUDBncD2rdtr0Tc4NZGHA658lRVd98gBnc4l9lmeNyDqM3q1NfqT+hTIinP5IZuvd6o
         dRiOFOnR8IvmOttePs5nolqth3ihdO4PRd3/74Lb2oJ5SDjVP8V5Rh4ALypBonPMjgcF
         YmOqvS92dojJ48i2by9Nm0nKQ5D4JQkenwth+RuDz1hgLbZDIQYCZNTTqyt0rFfiZryJ
         pTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=T43aVQzPiT0XjV9pueFSbLz7BuhEixxnvnl5P/7wszk=;
        b=R7hHaMU95kFN7J7zZ7ArsuWRGCMmXHg4qx2d2P5/MBKOTSIETkyRpwxsj0eEcPfnZE
         e4KQXe8jM6AHDX0oPVbpJrLA0J5FoIOsPz/tDwHAKEj1qva1NUPmctz5S4O/Gcg31tuu
         U0zhaqCpJIOkbF0XwB8CNgB3ym5YABYVC2HACnam460XFG/0+rY3in7jTEs53hyAhofF
         GpAejFBZU5o6ezJ4lHKHOqZl/NmI4frhKBWl2x3wwGKz3mBkJ18+bqk84qmG8vS5pvdN
         GbmNhdPBd2dC0ZGDnvT0COHJEazxMxNXHB2+XWlSpAVLw4nlACpWPzAShOCUvd47ZNzj
         ptnw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV9EmVgEc7fMfOuZBPjR7bMAof98mBE/pLZsoImomq99DSVb1DG
	jArRIWuwEM1U0heMLmdDLXM=
X-Google-Smtp-Source: APXvYqxVaXTclw1zG+Uzpqm6mWx8e56mZ68oZWMPJBYpf4kT0zB3xFc9ypUdXGQ5IT2tSv96E4KUvw==
X-Received: by 2002:adf:9003:: with SMTP id h3mr34661928wrh.172.1561464881304;
        Tue, 25 Jun 2019 05:14:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:cb50:: with SMTP id v16ls526976wmj.3.gmail; Tue, 25 Jun
 2019 05:14:40 -0700 (PDT)
X-Received: by 2002:a1c:ca06:: with SMTP id a6mr19975745wmg.48.1561464880805;
        Tue, 25 Jun 2019 05:14:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561464880; cv=none;
        d=google.com; s=arc-20160816;
        b=jUIz99fA5B2TsYUfHekNkTOsqqHBqWVywxW6lcw78kyBOpOicsK8AnsR7/Avpmf40a
         pdnG7D2RlUKCJ+VVpmrcdx3veFE4FqC9vQCH/S9K/ziGDeQaAAEXr+9HqRKiERqHzbSg
         plqdyFybvTyHxJhiUJ5R6zJEKozaOByv0mqofhp/ODgvC3sK4QNMLGT22Xw/59TSqtqL
         p9yNIzkpMzhekI2pbjj+Ow2EoaDUQoMuAyBu+qJJWvfEVvfxL/dyBZMiTIP8csQ+mR1f
         zHaw1TmZn2j/peRNnCET96xCLe08hK/lZZREE21RQBwKVaTzRfVpFkX3iAiEptoeUFCu
         e84w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:openpgp:from:references:to:subject
         :dkim-signature;
        bh=38aeDUxqIJYXc6Z9furEQjCStQ9gYqIkBh7y3hHILV0=;
        b=ot9rPFCmGUaCuKjEDpyYVaROCjalNHlvWyXTETfMf/p7y6ABabqH//5eXxjgVnx0nQ
         TFfDMofx9GEz7L6fYiQ+fCoBCcmPDuoEp8wYBQWK1S9DR6TSmxAasoHwK0c9QJ4VU79f
         vpAyt7O3xwL6fYA5ffOUZ+SlFp/SN419nAEe+xDAlJkJAlsX8kt5R67m5XnB6m9X/0wC
         1GJqM/JEhybc4muRaPIlUMzVU/06Tmbm5UZSPywukxaYYp/jr670LJ+TmQnLBRaDyls6
         iyVc/5Ne5Af3tuepzMB7g4OlqcytBZ32uWmh4nDAg7sQSfavAjM1B4JEPlsHrb4HDcQR
         2qoA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=rZPgTmt+;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id d5si1011904wrb.0.2019.06.25.05.14.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Jun 2019 05:14:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 45Y4pm2YnXzyBd;
	Tue, 25 Jun 2019 14:14:40 +0200 (CEST)
Received: from [172.16.2.24] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 25 Jun
 2019 14:14:39 +0200
Subject: Re: Jailhouse enable hangs on AMD EPYC 7351P
To: Adam Przybylski <adamprz@gmx.de>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <d069200e-ba34-41bc-854c-8a95d62f2596@googlegroups.com>
 <ca059740-300b-f5df-3dda-65ef289599f6@gmail.com>
 <b22e6a12-a5df-c698-d4ce-652c5376ee4e@oth-regensburg.de>
 <20190621155406.18df2751@md1za8fc.ad001.siemens.net>
 <bc4047f6-c6c7-4b74-9084-51212c8bd4ad@googlegroups.com>
 <20190623183232.084b6744@md1za8fc.ad001.siemens.net>
 <98b65827-1a4c-48c7-8501-8103ee8e9284@googlegroups.com>
 <af790385-ad03-9fcc-33bb-60dfed20e169@oth-regensburg.de>
 <510bf146-8ec5-414d-8a22-33d61476ee1f@googlegroups.com>
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
Message-ID: <e0d7a082-bb03-195a-d146-4ba627a93be4@oth-regensburg.de>
Date: Tue, 25 Jun 2019 14:14:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <510bf146-8ec5-414d-8a22-33d61476ee1f@googlegroups.com>
Content-Type: multipart/mixed;
	boundary="------------11632DE002BAFB562180AAD7"
Content-Language: en-PH
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=rZPgTmt+;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

--------------11632DE002BAFB562180AAD7
Content-Type: text/plain; charset="UTF-8"

On 6/25/19 1:31 PM, Adam Przybylski wrote:
> Am Dienstag, 25. Juni 2019 12:10:03 UTC+2 schrieb Ralf Ramsauer:
>> Hi,
>>
>> On 6/25/19 9:38 AM, Adam Przybylski wrote:
>>> Am Sonntag, 23. Juni 2019 18:32:37 UTC+2 schrieb Henning Schild:
>>>> Am Fri, 21 Jun 2019 07:18:14 -0700
>>>> schrieb Adam Przybylski:
>>>>
>>>>> Am Freitag, 21. Juni 2019 15:54:15 UTC+2 schrieb Henning Schild:
>>>>>> Am Fri, 21 Jun 2019 14:51:30 +0200
>>>>>> schrieb Ralf Ramsauer:
>>>>>>   
>>>>>>> Hi,
>>>>>>>
>>>>>>> On 6/21/19 2:22 PM, Valentine Sinitsyn wrote:  
>>>>>>>> Hi Adam,
>>>>>>>>
>>>>>>>> On 21.06.2019 17:16, Adam Przybylski wrote:    
>>>>>>>>> Dear Jailhouse Community,
>>>>>>>>>
>>>>>>>>> I am trying to enabled Jailhouse on the AMD EPYC 7351P 16-Core
>>>>>>>>> Processor. Unfortunately the system hangs after I execute
>>>>>>>>> "jailhouse enable sysconfig.cell".
>>>>>>>>>
>>>>>>>>> Do you have any hint how to debug and instrument this issue?
>>>>>>>>>
>>>>>>>>> Any kind of help is appreciated.
>>>>>>>>>
>>>>>>>>> Attached you can find the jailhouse logs, processor info, and
>>>>>>>>> sysconfig.c.
>>>>>>>>>
>>>>>>>>> Looking forward to hear from you.    
>>>>>>>> I'd say the following line is the culprit:
>>>>>>>>     
>>>>>>>>> FATAL: Invalid PIO read, port: 814 size: 1    
>>>>>>>
>>>>>>> Could you please attach /proc/ioports? This will tell us the
>>>>>>> secret behind Port 814.  
>>>>>>
>>>>>> Not always, the driver doing that has to be so friendly to register
>>>>>> the region.
>>>>>>   
>>>>>>>>
>>>>>>>> As a quick fix, you may grant your root cell access to all I/O
>>>>>>>> ports and see if it helps.    
>>>>>>>
>>>>>>> Allowing access will suppress the symptoms, yet we should
>>>>>>> investigate its cause. Depending on the semantics of Port 819, to
>>>>>>> allow access might have unintended side effects.
>>>>>>>
>>>>>>> You could also try to disassemble your kernel (objdump -d
>>>>>>> vmlinux) and check what function hides behind the instruction
>>>>>>> pointer at the moment of the crash 0xffffffffa4ac3114.  
>>>>>>
>>>>>> A look in the System.map can also answer that question. On a distro
>>>>>> that will be ready to read somewhere in /boot/.
>>>>>>
>>>>>> Henning
>>>>>>   
>>>>>>>   Ralf
>>>>>>>   
>>>>>>>>
>>>>>>>> Best,
>>>>>>>> Valentine
>>>>>>>>     
>>>>>>>>>
>>>>>>>>> Kind regards,
>>>>>>>>> Adam Przybylski
>>>>>>>>>    
>>>>>>>>     
>>>>>>>  
>>>>>
>>>>> Hi,
>>>>>
>>>>> I looked up the function which gets executed in the Kernel. It's
>>>>> "acpi_idle_do_entry".
>>>>
>>>> Well now you are back to what Valentine said. Open up those ports one
>>>> by one, until the problem goes away. The alternative is to disable the
>>>> drivers in the root-linux. In the case of ACPI i.e. acpi=off as kernel
>>>> parameter, but you probably do not want that.
>>>>
>>>> Note that whatever you allow might cause weaker isolation, in this case
>>>> maybe real-time related.
>>>>
>>>> Henning
>>>>
>>>>> Adam
>>>>>
>>>
>>> Hi,
>>>
>>> after allowing the access to 0x800-0x89f IO ports the issue with PIO read is solved.
>>>
>>> Now I am facing issues with IOMMU/RAM, NMI IPI, MSR. Please see attached log.
>>
>> You can again look at the system.map to find the code behind the MSR access.
>>
>> The rest can probably solved by consolidating some non-page aligned
>> spreaded memory regions in your config -- could you please attach the
>> output of jailhouse config collect? It should contain all data that is
>> relevant for debugging.
>>
>> Thanks
>>   Ralf
>>
>>>
>>> Any idea how to debug this?
>>>
>>> Adam
>>>
> 
> Hi,
> 
> attached the jailhouse config collect output.

Please try the attached config on next.

You can use diff to see what I changed: I consolidated some memory
regions to one large, contiguous region. Should at least solve the MMIO
traps and the unknown instruction error.

Remains the MSR access. What code is behind the instruction pointer?

Thanks
  Ralf

> 
> Adam
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e0d7a082-bb03-195a-d146-4ba627a93be4%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.

--------------11632DE002BAFB562180AAD7
Content-Type: text/x-csrc; name="adam-amd.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="adam-amd.c"

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Copyright (c) Siemens AG, 2014-2017
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 *
 * Alternatively, you can use or redistribute this file under the following
 * BSD license:
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
 * THE POSSIBILITY OF SUCH DAMAGE.
 *
 * Configuration for GIGABYTE MZ01-CE1-00
 * created with './tools/jailhouse config create -r /tmp/epyc/ adam-amd.c'
 *
 * NOTE: This config expects the following to be appended to your kernel cmdline
 *       "memmap=0x5200000$0x3a000000"
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
	struct jailhouse_system header;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[53];
	struct jailhouse_irqchip irqchips[5];
	__u8 pio_bitmap[0x2000];
	struct jailhouse_pci_device pci_devices[107];
	struct jailhouse_pci_capability pci_caps[109];
} __attribute__((packed)) config = {
	.header = {
		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
		.hypervisor_memory = {
			.phys_start = 0x3a000000,
			.size = 0x600000,
		},
		.debug_console = {
			.address = 0x3f8,
			.type = JAILHOUSE_CON_TYPE_8250,
			.flags = JAILHOUSE_CON_ACCESS_PIO |
				 JAILHOUSE_CON_REGDIST_1,
		},
		.platform_info = {
			.pci_mmconfig_base = 0xf0000000,
			.pci_mmconfig_end_bus = 0x7f,
			.x86 = {
				.pm_timer_address = 0x808,
				.vtd_interrupt_limit = 512,
				.iommu_units = {
					{
						.base = 0xebf00000,
						.size = 0x80000,
						.amd_bdf = 0x2,
						.amd_base_cap = 0x40,
						.amd_msi_cap = 0x64,
						.amd_features = 0x80048f6f,
					},
				},
			},
		},
		.root_cell = {
			.name = "RootCell",
			.cpu_set_size = sizeof(config.cpus),
			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
			.num_irqchips = ARRAY_SIZE(config.irqchips),
			.pio_bitmap_size = ARRAY_SIZE(config.pio_bitmap),
			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
			.num_pci_caps = ARRAY_SIZE(config.pci_caps),
		},
	},

	.cpus = {
		0x000000000000ffff,
	},

	.mem_regions = {
		/* MemRegion: 00000000-0009ffff : System RAM */
		{
			.phys_start = 0x0,
			.virt_start = 0x0,
			.size = 0xa0000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 00100000-39ffffff : System RAM */
		{
			.phys_start = 0x100000,
			.virt_start = 0x100000,
			.size = 0x39f00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 3f200000-75daffff : System RAM */
		{
			.phys_start = 0x3f200000,
			.virt_start = 0x3f200000,
			.size = 0x36bb0000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 76000000-d2afb017 : System RAM */
		/* MemRegion: d2afb018-d2b14457 : System RAM */
		/* MemRegion: d2b14458-d2b15017 : System RAM */
		/* MemRegion: d2b15018-d2b25857 : System RAM */
		/* MemRegion: d2b25858-d9036fff : System RAM */
		/* MemRegion: da49d000-da4b7fff : System RAM */
		/* MemRegion: da4b8000-da50ffff : ACPI Non-volatile Storage */
		{
			.phys_start = 0x76000000,
			.virt_start = 0x76000000,
			.size = 0x64510000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: dad6b000-dbffffff : System RAM */
		{
			.phys_start = 0xdad6b000,
			.virt_start = 0xdad6b000,
			.size = 0x1295000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: ea900000-ea9fffff : ccp */
		{
			.phys_start = 0xea900000,
			.virt_start = 0xea900000,
			.size = 0x100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: eaa01000-eaa01fff : ccp */
		{
			.phys_start = 0xeaa01000,
			.virt_start = 0xeaa01000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: eab00000-eabfffff : ccp */
		{
			.phys_start = 0xeab00000,
			.virt_start = 0xeab00000,
			.size = 0x100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: eac01000-eac01fff : ccp */
		{
			.phys_start = 0xeac01000,
			.virt_start = 0xeac01000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: ead00000-ead7ffff : 0000:63:00.0 */
		{
			.phys_start = 0xead00000,
			.virt_start = 0xead00000,
			.size = 0x80000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: ead80000-ead9ffff : 0000:63:00.0 */
		{
			.phys_start = 0xead80000,
			.virt_start = 0xead80000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: eada0000-eada3fff : ICH HD audio */
		{
			.phys_start = 0xeada0000,
			.virt_start = 0xeada0000,
			.size = 0x4000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: eae00000-eae03fff : 0000:61:00.0 */
		{
			.phys_start = 0xeae00000,
			.virt_start = 0xeae00000,
			.size = 0x4000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: eaf00000-eaf7ffff : igb */
		{
			.phys_start = 0xeaf00000,
			.virt_start = 0xeaf00000,
			.size = 0x80000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: eaf81000-eaf83fff : igb */
		{
			.phys_start = 0xeaf81000,
			.virt_start = 0xeaf81000,
			.size = 0x3000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: eb000000-eb002fff : nvme */
		{
			.phys_start = 0xeb000000,
			.virt_start = 0xeb000000,
			.size = 0x3000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: eb100000-eb17ffff : igb */
		{
			.phys_start = 0xeb100000,
			.virt_start = 0xeb100000,
			.size = 0x80000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: eb181000-eb183fff : igb */
		{
			.phys_start = 0xeb181000,
			.virt_start = 0xeb181000,
			.size = 0x3000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: eb400000-eb4fffff : ccp */
		{
			.phys_start = 0xeb400000,
			.virt_start = 0xeb400000,
			.size = 0x100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: eb501000-eb501fff : ccp */
		{
			.phys_start = 0xeb501000,
			.virt_start = 0xeb501000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: eb600000-eb6fffff : ccp */
		{
			.phys_start = 0xeb600000,
			.virt_start = 0xeb600000,
			.size = 0x100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: eb701000-eb701fff : ccp */
		{
			.phys_start = 0xeb701000,
			.virt_start = 0xeb701000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: eba00000-ebafdfff : xhci-hcd */
		{
			.phys_start = 0xeba00000,
			.virt_start = 0xeba00000,
			.size = 0xfe000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: ebaff000-ebafffff : xhci-hcd */
		{
			.phys_start = 0xebaff000,
			.virt_start = 0xebaff000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: ebb00000-ebbfffff : ccp */
		{
			.phys_start = 0xebb00000,
			.virt_start = 0xebb00000,
			.size = 0x100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: ebc01000-ebc01fff : ccp */
		{
			.phys_start = 0xebc01000,
			.virt_start = 0xebc01000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: ebd00000-ebdfffff : ccp */
		{
			.phys_start = 0xebd00000,
			.virt_start = 0xebd00000,
			.size = 0x100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: ebe01000-ebe01fff : ccp */
		{
			.phys_start = 0xebe01000,
			.virt_start = 0xebe01000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: ebe02000-ebe02fff : ahci */
		{
			.phys_start = 0xebe02000,
			.virt_start = 0xebe02000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: ec000000-edffffff : 0000:02:00.0 */
		{
			.phys_start = 0xec000000,
			.virt_start = 0xec000000,
			.size = 0x2000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: ee000000-ee01ffff : 0000:02:00.0 */
		{
			.phys_start = 0xee000000,
			.virt_start = 0xee000000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: ee200000-ee2fdfff : xhci-hcd */
		{
			.phys_start = 0xee200000,
			.virt_start = 0xee200000,
			.size = 0xfe000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: ee2ff000-ee2fffff : xhci-hcd */
		{
			.phys_start = 0xee2ff000,
			.virt_start = 0xee2ff000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: ee300000-ee3fffff : ccp */
		{
			.phys_start = 0xee300000,
			.virt_start = 0xee300000,
			.size = 0x100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: ee401000-ee401fff : ccp */
		{
			.phys_start = 0xee401000,
			.virt_start = 0xee401000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: ee500000-ee5fffff : ccp */
		{
			.phys_start = 0xee500000,
			.virt_start = 0xee500000,
			.size = 0x100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: ee601000-ee601fff : ccp */
		{
			.phys_start = 0xee601000,
			.virt_start = 0xee601000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: ee602000-ee602fff : ahci */
		{
			.phys_start = 0xee602000,
			.virt_start = 0xee602000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fec01000-fec01fff : pnp 00:05 */
		{
			.phys_start = 0xfec01000,
			.virt_start = 0xfec01000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed00000-fed003ff : HPET 0 */
		{
			.phys_start = 0xfed00000,
			.virt_start = 0xfed00000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed61000-fed70fff : pnp 00:05 */
		{
			.phys_start = 0xfed61000,
			.virt_start = 0xfed61000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 100000000-21f37ffff : System RAM */
		{
			.phys_start = 0x100000000,
			.virt_start = 0x100000000,
			.size = 0x11f380000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 220000000-41ff7ffff : System RAM */
		{
			.phys_start = 0x220000000,
			.virt_start = 0x220000000,
			.size = 0x1fff80000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 420000000-4c2ffffff : System RAM */
		{
			.phys_start = 0x420000000,
			.virt_start = 0x420000000,
			.size = 0xa3000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 4c3000000-4c6ffffff : Kernel */
		{
			.phys_start = 0x4c3000000,
			.virt_start = 0x4c3000000,
			.size = 0x4000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 4c7000000-61ff7ffff : System RAM */
		{
			.phys_start = 0x4c7000000,
			.virt_start = 0x4c7000000,
			.size = 0x158f80000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 620000000-81ff7ffff : System RAM */
		{
			.phys_start = 0x620000000,
			.virt_start = 0x620000000,
			.size = 0x1fff80000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: a00000000-a001fffff : 0000:63:00.0 */
		{
			.phys_start = 0xa00000000,
			.virt_start = 0xa00000000,
			.size = 0x200000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: c00000000-fffffffff : 0000:63:00.0 */
		{
			.phys_start = 0xc00000000,
			.virt_start = 0xc00000000,
			.size = 0x400000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 82c8000000-fcffffffff : PCI Bus 0000:40 */
		{
			.phys_start = 0x82c8000000,
			.virt_start = 0x82c8000000,
			.size = 0x7a38000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 10b90000000-185c7ffffff : PCI Bus 0000:20 */
		{
			.phys_start = 0x10b90000000,
			.virt_start = 0x10b90000000,
			.size = 0x7a38000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 185c8000000-1ffffffffff : PCI Bus 0000:00 */
		{
			.phys_start = 0x185c8000000,
			.virt_start = 0x185c8000000,
			.size = 0x7a38000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 3a600000-3f1fffff : JAILHOUSE Inmate Memory */
		{
			.phys_start = 0x3a600000,
			.virt_start = 0x3a600000,
			.size = 0x4c00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
	},

	.irqchips = {
		/* IOAPIC 128, GSI base 0 */
		{
			.address = 0xfec00000,
			.id = 0xa0,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
		/* IOAPIC 129, GSI base 24 */
		{
			.address = 0xebff0000,
			.id = 0x1,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
		/* IOAPIC 130, GSI base 56 */
		{
			.address = 0xeb9f0000,
			.id = 0x0,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
		/* IOAPIC 131, GSI base 88 */
		{
			.address = 0xeb3f0000,
			.id = 0x0,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
		/* IOAPIC 132, GSI base 120 */
		{
			.address = 0xea8f0000,
			.id = 0x0,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
	},

	.pio_bitmap = {
		[   0x0/8 ...   0x3f/8] =    0,
		[  0x40/8 ...   0x47/8] = 0xf0, /* PIT */
		[  0x50/8 ...   0x57/8] =   -1, /* timer1 */
		[  0x60/8 ...   0x67/8] = 0xec, /* NMI +NMI +keyboard */
		[  0x70/8 ...   0x77/8] = 0xfc, /* RTC */
		[  0xa0/8 ...   0xa7/8] =   -1, /* pic2 */
		[  0xb0/8 ...   0xb7/8] =   -1, /* APEI ERST */
		[ 0x2f8/8 ...  0x2ff/8] =   -1, /* serial */
		[ 0x3b0/8 ...  0x3df/8] =    0, /* VGA */
		[ 0x3f8/8 ...  0x3ff/8] =   -1, /* serial */
		[ 0x408/8 ...  0x40f/8] =   -1, /* pnp 00:05 */
		[ 0x4d0/8 ...  0x4d7/8] =   -1, /* pnp 00:05 +pnp 00:05 */
#if 0
		[ 0x800/8 ...  0x807/8] = 0xc0, /* ACPI PM1a_EVT_BLK +ACPI PM1a_CNT_BLK */
		[ 0x808/8 ...  0x80f/8] = 0xf0, /* ACPI PM_TMR */
		[ 0x820/8 ...  0x827/8] =    0, /* ACPI GPE0_BLK */
#else
		[ 0x800/8 ...  0x809/8] =    0,
#endif
		[ 0xb00/8 ...  0xb0f/8] =   -1, /* piix4_smbus */
		[ 0xc00/8 ...  0xc07/8] =   -1, /* pnp 00:05 */
		[ 0xc10/8 ...  0xc17/8] =   -1, /* pnp 00:05 */
		[ 0xc50/8 ...  0xc57/8] =   -1, /* pnp 00:05 +pnp 00:05 */
		[ 0xc68/8 ...  0xc6f/8] =   -1, /* pnp 00:05 +pnp 00:05 */
		[ 0xca0/8 ...  0xca7/8] =   -1, /* ipmi_si +ipmi_si */
		[ 0xcd0/8 ...  0xcd7/8] =   -1, /* pnp 00:05 +pnp 00:05 +pnp 00:05 +pnp 00:05 */
		[ 0xcd8/8 ...  0xcdf/8] =   -1, /* pnp 00:05 */
		[ 0xcf8/8 ...  0xcff/8] =   -1, /* PCI conf1 */
		[ 0xd00/8 ... 0xffff/8] =    0, /* PCI bus */
	},


	.pci_devices = {
		/* PCIDevice: 00:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.domain = 0x0,
			.bdf = 0x0,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:01.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x8,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:01.6 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xe,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 3,
			.num_caps = 12,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:02.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x10,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:03.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x18,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:04.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x20,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:07.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x38,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:07.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x39,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 15,
			.num_caps = 9,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:08.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x40,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:08.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x41,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 15,
			.num_caps = 9,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:14.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xa0,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:14.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xa3,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:18.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xc0,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:18.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xc1,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:18.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xc2,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:18.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xc3,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:18.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xc4,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:18.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xc5,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:18.6 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xc6,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:18.7 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xc7,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:19.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xc8,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:19.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xc9,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:19.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xca,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:19.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xcb,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:19.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xcc,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:19.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xcd,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:19.6 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xce,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:19.7 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xcf,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1a.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xd0,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1a.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xd1,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1a.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xd2,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1a.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xd3,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1a.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xd4,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1a.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xd5,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1a.6 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xd6,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1a.7 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xd7,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1b.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xd8,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1b.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xd9,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1b.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xda,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1b.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xdb,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1b.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xdc,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1b.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xdd,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1b.6 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xde,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1b.7 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xdf,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 01:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x100,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 24,
			.num_caps = 6,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 02:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x200,
			.bar_mask = {
				0xfe000000, 0xfffe0000, 0xffffff80,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 30,
			.num_caps = 2,
			.num_msi_vectors = 2,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 03:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x300,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 32,
			.num_caps = 7,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 03:00.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x302,
			.bar_mask = {
				0x00000000, 0x00000000, 0xfff00000,
				0x00000000, 0x00000000, 0xffffe000,
			},
			.caps_start = 39,
			.num_caps = 8,
			.num_msi_vectors = 2,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 2,
			.msix_region_size = 0x1000,
			.msix_address = 0xee400000,
		},
		/* PCIDevice: 03:00.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x303,
			.bar_mask = {
				0xfff00000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 39,
			.num_caps = 8,
			.num_msi_vectors = 8,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 8,
			.msix_region_size = 0x1000,
			.msix_address = 0xee2fe000,
		},
		/* PCIDevice: 04:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x400,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 32,
			.num_caps = 7,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 04:00.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x401,
			.bar_mask = {
				0x00000000, 0x00000000, 0xfff00000,
				0x00000000, 0x00000000, 0xffffe000,
			},
			.caps_start = 39,
			.num_caps = 8,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 1,
			.msix_region_size = 0x1000,
			.msix_address = 0xee600000,
		},
		/* PCIDevice: 04:00.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x402,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0xfffff000,
			},
			.caps_start = 47,
			.num_caps = 8,
			.num_msi_vectors = 16,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 20:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x2000,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 20:00.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x2002,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 3,
			.num_msi_vectors = 4,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 20:01.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x2008,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 20:02.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x2010,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 20:03.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x2018,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 20:04.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x2020,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 20:07.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x2038,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 20:07.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x2039,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 15,
			.num_caps = 9,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 20:08.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x2040,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 20:08.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x2041,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 15,
			.num_caps = 9,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 21:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x2100,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 32,
			.num_caps = 7,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 21:00.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x2102,
			.bar_mask = {
				0x00000000, 0x00000000, 0xfff00000,
				0x00000000, 0x00000000, 0xffffe000,
			},
			.caps_start = 39,
			.num_caps = 8,
			.num_msi_vectors = 2,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 2,
			.msix_region_size = 0x1000,
			.msix_address = 0xebc00000,
		},
		/* PCIDevice: 21:00.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x2103,
			.bar_mask = {
				0xfff00000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 39,
			.num_caps = 8,
			.num_msi_vectors = 8,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 8,
			.msix_region_size = 0x1000,
			.msix_address = 0xebafe000,
		},
		/* PCIDevice: 22:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x2200,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 32,
			.num_caps = 7,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 22:00.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x2201,
			.bar_mask = {
				0x00000000, 0x00000000, 0xfff00000,
				0x00000000, 0x00000000, 0xffffe000,
			},
			.caps_start = 39,
			.num_caps = 8,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 1,
			.msix_region_size = 0x1000,
			.msix_address = 0xebe00000,
		},
		/* PCIDevice: 22:00.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x2202,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0xfffff000,
			},
			.caps_start = 47,
			.num_caps = 8,
			.num_msi_vectors = 16,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 40:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x4000,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 40:00.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x4002,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 3,
			.num_msi_vectors = 4,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 40:01.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x4008,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 40:02.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x4010,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 40:03.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x4018,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 40:04.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x4020,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 40:07.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x4038,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 40:07.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x4039,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 15,
			.num_caps = 9,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 40:08.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x4040,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 40:08.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x4041,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 15,
			.num_caps = 9,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 41:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x4100,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 32,
			.num_caps = 7,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 41:00.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x4102,
			.bar_mask = {
				0x00000000, 0x00000000, 0xfff00000,
				0x00000000, 0x00000000, 0xffffe000,
			},
			.caps_start = 39,
			.num_caps = 8,
			.num_msi_vectors = 2,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 2,
			.msix_region_size = 0x1000,
			.msix_address = 0xeb700000,
		},
		/* PCIDevice: 42:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x4200,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 32,
			.num_caps = 7,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 42:00.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x4201,
			.bar_mask = {
				0x00000000, 0x00000000, 0xfff00000,
				0x00000000, 0x00000000, 0xffffe000,
			},
			.caps_start = 39,
			.num_caps = 8,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 1,
			.msix_region_size = 0x1000,
			.msix_address = 0xeb500000,
		},
		/* PCIDevice: 60:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x6000,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 60:00.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x6002,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 3,
			.num_msi_vectors = 4,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 60:01.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x6008,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 60:01.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x6009,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 3,
			.num_caps = 12,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 60:02.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x6010,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 60:03.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x6018,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 60:03.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x601a,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 3,
			.num_caps = 12,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 60:03.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x601b,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 3,
			.num_caps = 12,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 60:03.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x601c,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 3,
			.num_caps = 12,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 60:04.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x6020,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 60:07.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x6038,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 60:07.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x6039,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 15,
			.num_caps = 9,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 60:08.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x6040,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 60:08.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x6041,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 15,
			.num_caps = 9,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 61:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x6100,
			.bar_mask = {
				0xffffc000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 55,
			.num_caps = 9,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 62:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x6200,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 64,
			.num_caps = 8,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 63:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x6300,
			.bar_mask = {
				0x00000000, 0xfffffffc, 0xffe00000,
				0xffffffff, 0xffffff00, 0xfff80000,
			},
			.caps_start = 72,
			.num_caps = 13,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 63:00.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x6301,
			.bar_mask = {
				0xffffc000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 85,
			.num_caps = 7,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 64:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x6400,
			.bar_mask = {
				0xfff80000, 0x00000000, 0xffffffe0,
				0xffffc000, 0x00000000, 0x00000000,
			},
			.caps_start = 92,
			.num_caps = 7,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 1,
			.num_msix_vectors = 5,
			.msix_region_size = 0x1000,
			.msix_address = 0xeb180000,
		},
		/* PCIDevice: 65:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x6500,
			.bar_mask = {
				0xffffc000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 99,
			.num_caps = 10,
			.num_msi_vectors = 32,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 33,
			.msix_region_size = 0x1000,
			.msix_address = 0xeb003000,
		},
		/* PCIDevice: 66:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x6600,
			.bar_mask = {
				0xfff80000, 0x00000000, 0xffffffe0,
				0xffffc000, 0x00000000, 0x00000000,
			},
			.caps_start = 92,
			.num_caps = 7,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 1,
			.num_msix_vectors = 5,
			.msix_region_size = 0x1000,
			.msix_address = 0xeaf80000,
		},
		/* PCIDevice: 67:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x6700,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 32,
			.num_caps = 7,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 67:00.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x6702,
			.bar_mask = {
				0x00000000, 0x00000000, 0xfff00000,
				0x00000000, 0x00000000, 0xffffe000,
			},
			.caps_start = 39,
			.num_caps = 8,
			.num_msi_vectors = 2,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 2,
			.msix_region_size = 0x1000,
			.msix_address = 0xeac00000,
		},
		/* PCIDevice: 68:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x6800,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 32,
			.num_caps = 7,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 68:00.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x6801,
			.bar_mask = {
				0x00000000, 0x00000000, 0xfff00000,
				0x00000000, 0x00000000, 0xffffe000,
			},
			.caps_start = 39,
			.num_caps = 8,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 1,
			.msix_region_size = 0x1000,
			.msix_address = 0xeaa00000,
		},
	},

	.pci_caps = {
		/* PCIDevice: 00:00.2 */
		/* PCIDevice: 20:00.2 */
		/* PCIDevice: 40:00.2 */
		/* PCIDevice: 60:00.2 */
		{
			.id = PCI_CAP_ID_SECDEV,
			.start = 0x40,
			.len = 2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x64,
			.len = 14,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_HT,
			.start = 0x74,
			.len = 2,
			.flags = 0,
		},
		/* PCIDevice: 00:01.6 */
		/* PCIDevice: 60:01.1 */
		/* PCIDevice: 60:03.2 */
		/* PCIDevice: 60:03.3 */
		/* PCIDevice: 60:03.4 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x50,
			.len = 8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x58,
			.len = 60,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0xa0,
			.len = 14,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_SSVID,
			.start = 0xc0,
			.len = 2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_HT,
			.start = 0xc8,
			.len = 2,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x150,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_SECPCI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x270,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ACS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x2a0,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_L1SS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x370,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_DPC | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x380,
			.len = 4,
			.flags = 0,
		},
		{
			.id = 0x23 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x3c4,
			.len = 4,
			.flags = 0,
		},
		/* PCIDevice: 00:07.1 */
		/* PCIDevice: 00:08.1 */
		/* PCIDevice: 20:07.1 */
		/* PCIDevice: 20:08.1 */
		/* PCIDevice: 40:07.1 */
		/* PCIDevice: 40:08.1 */
		/* PCIDevice: 60:07.1 */
		/* PCIDevice: 60:08.1 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x50,
			.len = 8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x58,
			.len = 60,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0xa0,
			.len = 14,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_SSVID,
			.start = 0xc0,
			.len = 2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_HT,
			.start = 0xc8,
			.len = 2,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x150,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_SECPCI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x270,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ACS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x2a0,
			.len = 4,
			.flags = 0,
		},
		/* PCIDevice: 01:00.0 */
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x50,
			.len = 14,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x78,
			.len = 8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x80,
			.len = 60,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_SSVID,
			.start = 0xc0,
			.len = 2,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VC | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x800,
			.len = 4,
			.flags = 0,
		},
		/* PCIDevice: 02:00.0 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x40,
			.len = 8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x50,
			.len = 14,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		/* PCIDevice: 03:00.0 */
		/* PCIDevice: 04:00.0 */
		/* PCIDevice: 21:00.0 */
		/* PCIDevice: 22:00.0 */
		/* PCIDevice: 41:00.0 */
		/* PCIDevice: 42:00.0 */
		/* PCIDevice: 67:00.0 */
		/* PCIDevice: 68:00.0 */
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0x48,
			.len = 2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x50,
			.len = 8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x64,
			.len = 60,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x150,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_SECPCI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x270,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ACS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x2a0,
			.len = 4,
			.flags = 0,
		},
		/* PCIDevice: 03:00.2 */
		/* PCIDevice: 03:00.3 */
		/* PCIDevice: 04:00.1 */
		/* PCIDevice: 21:00.2 */
		/* PCIDevice: 21:00.3 */
		/* PCIDevice: 22:00.1 */
		/* PCIDevice: 41:00.2 */
		/* PCIDevice: 42:00.1 */
		/* PCIDevice: 67:00.2 */
		/* PCIDevice: 68:00.1 */
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0x48,
			.len = 2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x50,
			.len = 8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x64,
			.len = 60,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0xa0,
			.len = 14,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSIX,
			.start = 0xc0,
			.len = 12,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x150,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ACS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x2a0,
			.len = 4,
			.flags = 0,
		},
		/* PCIDevice: 04:00.2 */
		/* PCIDevice: 22:00.2 */
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0x48,
			.len = 2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x50,
			.len = 8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x64,
			.len = 60,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0xa0,
			.len = 14,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_SATA,
			.start = 0xd0,
			.len = 2,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x150,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ACS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x2a0,
			.len = 4,
			.flags = 0,
		},
		/* PCIDevice: 61:00.0 */
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0x48,
			.len = 2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x50,
			.len = 8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x58,
			.len = 60,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0xa0,
			.len = 14,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x150,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_SECPCI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x270,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_LTR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x320,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_L1SS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x370,
			.len = 4,
			.flags = 0,
		},
		/* PCIDevice: 62:00.0 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x50,
			.len = 8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x58,
			.len = 60,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0xa0,
			.len = 14,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_SSVID,
			.start = 0xc0,
			.len = 2,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x150,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_SECPCI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x270,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ACS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x2a0,
			.len = 4,
			.flags = 0,
		},
		/* PCIDevice: 63:00.0 */
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0x48,
			.len = 2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x50,
			.len = 8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x64,
			.len = 60,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0xa0,
			.len = 14,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x150,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_REBAR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x200,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_SECPCI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x270,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ACS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x2a0,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ATS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x2b0,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_PRI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x2c0,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_PASID | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x2d0,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_LTR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x320,
			.len = 4,
			.flags = 0,
		},
		/* PCIDevice: 63:00.1 */
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0x48,
			.len = 2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x50,
			.len = 8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x64,
			.len = 60,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0xa0,
			.len = 14,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x150,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ACS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x2a0,
			.len = 4,
			.flags = 0,
		},
		/* PCIDevice: 64:00.0 */
		/* PCIDevice: 66:00.0 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x40,
			.len = 8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x50,
			.len = 24,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSIX,
			.start = 0x70,
			.len = 12,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0xa0,
			.len = 60,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_DSN | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x140,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_TPH | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x1a0,
			.len = 4,
			.flags = 0,
		},
		/* PCIDevice: 65:00.0 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x40,
			.len = 8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x50,
			.len = 14,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x70,
			.len = 60,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSIX,
			.start = 0xb0,
			.len = 12,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_DSN | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x148,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_PWR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x158,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_SECPCI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x168,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_LTR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x188,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_L1SS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x190,
			.len = 4,
			.flags = 0,
		},
	},
};

--------------11632DE002BAFB562180AAD7--
