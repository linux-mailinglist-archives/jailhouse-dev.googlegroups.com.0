Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBIMM4LTAKGQEMAABOKI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DAA1AE27
	for <lists+jailhouse-dev@lfdr.de>; Sun, 12 May 2019 22:46:26 +0200 (CEST)
Received: by mail-ed1-x53a.google.com with SMTP id c1sf14578330edi.20
        for <lists+jailhouse-dev@lfdr.de>; Sun, 12 May 2019 13:46:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557693985; cv=pass;
        d=google.com; s=arc-20160816;
        b=kOChrYLR4pho5SNN4a3Z8SmyYGBi3NtvwEkp/1okV7mH4Mcd+ZyvFkIlAjtiJd1Av+
         aq1dw9VwH3uAZf5ZyXnuhWlxn62lnLImJdvUZ2X5ZSnBo6AtGUS4U65W5e6BWzHqzuwv
         o8MdIkrKd6L2mzqRvfAd16vgxr7PagsaW32JRk+6TBRkK6Q7hastdrM653k5Ox2ra7sc
         IrMVSlD4HaVO4KeItBvWjHXPXmplJDdQrJEv9WyCa0mmneU1UJA+7Zorh2tuzGHOz4BX
         63VVNMppe62zt/uvVahuR3IbPdfoSwVQKQYbauHy133ve6jdHO38LLcVBy7j0c46diTm
         CWfA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:subject:sender:dkim-signature;
        bh=waSesHRKSIaouyMhJf0CvVZ/N1JRSUEPA0X9yRfKd80=;
        b=hm+Tw14X7t9+RmLok5gwv3WYrBycb8ybFspAi0JDob2WF1uh1MGFbXLR4GoJd6/UpJ
         75DC39Sy0KVvZwD/ZeqSF90u8JASZ3mEJvhWeDQkY69NsiiQCNI5Iq9Fl6NNJftal/OB
         18u9cczgTR/bYIdmNwBKA52WKfXibTyaPUcjvF5m4tIN1VGnwifbe64ABsXCBun2J1ec
         o++5H9l41y4LdUORPyaSjfti+rT710/BOkZ8qzwlyS4Nqtfhe/SlJfSchUf21+Q5nl7d
         fWnFqY/AxkIhBqO/sHItgt3pPwfZvVqP/FJazM/Bb3GS4aniRHwiXEEhGY0pNXfAYqfc
         jdwQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=oUky0t5Q;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=waSesHRKSIaouyMhJf0CvVZ/N1JRSUEPA0X9yRfKd80=;
        b=FqqlCf+9mz8vK+RzI2sHT0u0qNDVjsqRS4irTRorQ9859bMvfNiX/tycDtzDVqGxXJ
         tprX8REYekldoBezhMvEGUfuZ+Rzhd2VqZezs571vC0EFPkA0HqMkWc+PGjNTA2MWxZN
         ZlySZEmI7Ipr3J7UOTFMMcXudtfgvdXF7f6waQ0O7l4iXANZ4wEXrELN4lx5+vC28Hfx
         1a/ND8TtfXyEEFk8kKqwwfwLlEmNWpjRcwCKs0tiDU3mimh+Q6VFdFnJ8oPNpwDU86Jp
         0v9rC00fcq91d7R5rsf2IgQsEd3EXNPeHNUBEuV5GO9JvFUXTnKyOvIF5MRm+3EvSoNf
         ktow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=waSesHRKSIaouyMhJf0CvVZ/N1JRSUEPA0X9yRfKd80=;
        b=lZDUJRb6gkC3PSJ7gqb04auoP3me5HS23v2Lb75SXf2J32hyjx86ZHayOz18zIaNpV
         OMpbBEfT3iGvflYAA/QMR+asqCipoKuTQ/fkfABnEMrvQwcAxyNJWZIYOnsHQ2Rw/CyP
         AfYAChhkZbntFPMwCnyJbpgMj9rEckkGNcyn8zYjo/fxUlShty5/VZA549oJO4ylvj5p
         X+QmRPJNt3eqr13ov+vmwPlQ9u3BpRvqhM34LopJLEX5GsJd1qg7D8EHeexzykdS3BiK
         5JajKSPwCgoiYdFSsgFy8hdo5QJEiaTkNi7dNWrPEktMM1wIYULs3S+q+kXlArZOttIg
         cSBg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVusoXqyT/Dae7gIAu1kszT2o94cK9gXw9gERMtQ4yzZifzls+E
	pr86KYohX+0GpLtubFCmXYc=
X-Google-Smtp-Source: APXvYqz0GRraapca0vS1S5FI33TWzqPt0GBz6tRlM8inTSuT3DTebnfiUFc/6Q4FPI11HiabJBw+EQ==
X-Received: by 2002:a17:906:1e0a:: with SMTP id g10mr11800207ejj.127.1557693985618;
        Sun, 12 May 2019 13:46:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:c50:: with SMTP id t16ls2585863ejf.15.gmail; Sun, 12
 May 2019 13:46:25 -0700 (PDT)
X-Received: by 2002:a17:906:a48:: with SMTP id x8mr19190624ejf.247.1557693984952;
        Sun, 12 May 2019 13:46:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557693984; cv=none;
        d=google.com; s=arc-20160816;
        b=OzMGBeobyOClrzwtfWVPYF4zR/8+gwFcoxUVulUC8t5U+2u6PULU4h0zcq0DFJSAEi
         8oA5xHfMU5iIXfIEYNmZPYRF0s+3xwOQ4gKbFm4QedJM3lJKiCMGCoLvd1fXWFK3vKLb
         TedKPV3+r+scn+EiMPDJzHPtVhRtswM6Pa/NvZS1V/JiJwi8yUrcWhFDeYAna78AF8D7
         63EdQtANL4hIopk1ppZcKyudOs822eng01LpPRqbxVSQzkp7ckCZsfgYgY83GQRddcop
         y91TbmnKUgWCZseSqdiut2I/iA6oYMTvf+FoRJ/WnSYtdnpBN7+0DzlmBleKsSIUdkzX
         swew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :subject:dkim-signature;
        bh=QUG61tDAEvUA7IoO8YFYsdsqFT2d0Fw8OvllAVEsdhc=;
        b=eum6zSLkDPMs7oLbXb9oKFgUgF0NDgHumBjt+jcuR2IsKABrvSPjgrMN6Nu8yOkD0O
         EWlOFEGWWfL89UnKi6N4DlfY856yDdg5ST++O+0RhAKSKPa3jfPs2GS3SFTCvWMLUrwT
         qqBbdinKQ7TTikvfLzKsiV2cwoAsqaDHMm8dF5BecUDpuTOyk7TjbN3aUr7/vRP0xylf
         g0+uRC0oJyolShKLLBxDsQVEp663VTQ7A2NQnFwRTO3CPEzg9Jy7m4CTM0au7132B0cG
         es31MLBC2EAfLPzaiVusmTrXoeaCL7hD7Kn4hCGoLM0mtzGdtt8GHm6vwaxeb4T4soSd
         jL7Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=oUky0t5Q;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id t36si3440949edb.0.2019.05.12.13.46.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 May 2019 13:46:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 452GFX32fhzy9f;
	Sun, 12 May 2019 22:46:24 +0200 (CEST)
Received: from [172.23.4.153] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sun, 12 May
 2019 22:46:24 +0200
Subject: Re: [PATCH v4 5/6] pyjailhouse: let the generator produce speaking
 names for PCI caps
To: Jan Kiszka <jan.kiszka@web.de>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190509165231.18572-1-ralf.ramsauer@oth-regensburg.de>
 <20190509165231.18572-6-ralf.ramsauer@oth-regensburg.de>
 <14e75933-dbd9-5070-8b55-439978fb32b1@web.de>
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
Message-ID: <ea00d0ad-2353-71d9-1a9a-62b5f0cb4376@oth-regensburg.de>
Date: Sun, 12 May 2019 22:46:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <14e75933-dbd9-5070-8b55-439978fb32b1@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=oUky0t5Q;
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

On 5/12/19 10:45 AM, Jan Kiszka wrote:
> From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> 
> Definitions on C-side are in place, so let the generator produce those
> definitions.
> 
> Therefore, we autogenerate pyjailhouse/pci_defs.py.
> 
> The generator will extract PCI_CAP_IDs with grep & sed, fill the template and
> print the generated python file. The Makefile will redirect the output to the
> final destination.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> [Jan: moved pci_defs.py generation, refactored extended caps ID string]
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
> 
> I would rather go for this version unless you have concerns.

Thanks, looks good to me.

  Ralf.

> 
>  .gitignore                    |  1 +
>  Kbuild                        | 14 +++++++++++++-
>  Makefile                      |  2 +-
>  pyjailhouse/sysfs_parser.py   | 33 ++++++++++++++++++++------------
>  scripts/gen_pci_defs.sh       | 44 +++++++++++++++++++++++++++++++++++++++++++
>  tools/root-cell-config.c.tmpl |  6 +-----
>  6 files changed, 81 insertions(+), 19 deletions(-)
>  create mode 100755 scripts/gen_pci_defs.sh
> 
> diff --git a/.gitignore b/.gitignore
> index 494b9356..c8a96df0 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -19,6 +19,7 @@ include/jailhouse/config.h
>  hypervisor/hypervisor.lds
>  inmates/lib/arm/inmate.lds
>  inmates/lib/arm64/inmate.lds
> +pyjailhouse/pci_defs.py
>  tools/jailhouse
>  tools/jailhouse-gcov-extract
>  tools/jailhouse-config-collect
> diff --git a/Kbuild b/Kbuild
> index 71c232d4..7cbde529 100644
> --- a/Kbuild
> +++ b/Kbuild
> @@ -41,6 +41,16 @@ GEN_VERSION_H := $(obj)/hypervisor/include/generated/version.h
>  $(GEN_VERSION_H): $(src)/Makefile FORCE
>  	$(call filechk,version)
> 
> +quiet_cmd_gen_pci_defs = GEN     $@
> +define cmd_gen_pci_defs
> +	$^ $(src)/include/jailhouse/pci_defs.h > $@
> +endef
> +
> +GEN_PCI_DEFS_PY := $(obj)/pyjailhouse/pci_defs.py
> +
> +$(GEN_PCI_DEFS_PY): $(src)/scripts/gen_pci_defs.sh
> +	$(call if_changed,gen_pci_defs)
> +
>  subdir-y := driver hypervisor configs inmates tools
> 
>  subdir-ccflags-y := -Werror
> @@ -52,9 +62,11 @@ $(addprefix $(obj)/,$(subdir-y)): $(GEN_CONFIG_MK)
> 
>  $(obj)/driver $(obj)/hypervisor: $(GEN_VERSION_H)
> 
> +$(obj)/tools: $(GEN_PCI_DEFS_PY)
> +
>  endif
> 
> -clean-files := pyjailhouse/*.pyc
> +clean-files := pyjailhouse/*.pyc pyjailhouse/pci_defs.py
> 
>  clean-dirs := Documentation/generated hypervisor/include/generated \
>  	      pyjailhouse/__pycache__
> diff --git a/Makefile b/Makefile
> index 217b7c9f..74017395 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -59,4 +59,4 @@ ifeq ($(strip $(PYTHON_PIP_USABLE)), yes)
>  endif
> 
>  .PHONY: modules_install install clean firmware_install modules tools docs \
> -	docs_clean pyjailhouse_install
> +	docs_clean
> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
> index 08c7ed77..fa32ba48 100644
> --- a/pyjailhouse/sysfs_parser.py
> +++ b/pyjailhouse/sysfs_parser.py
> @@ -22,6 +22,8 @@ import struct
>  import os
>  import fnmatch
> 
> +from .pci_defs import PCI_CAP_ID, PCI_EXT_CAP_ID
> +
>  root_dir = "/"
> 
> 
> @@ -368,7 +370,7 @@ def parse_ivrs(pcidevices, ioapics):
>                  if d.bdf() == iommu_bdf:
>                      # Extract MSI capability offset
>                      for c in d.caps:
> -                        if c.id == 0x05:
> +                        if c.id == PCI_CAP_ID.MSI:
>                              msi_cap_ofs = c.start
>                      # We must not map IOMMU to the cells
>                      del pcidevices[i]
> @@ -543,8 +545,9 @@ class PCIBARs:
> 
> 
>  class PCICapability:
> -    def __init__(self, id, start, len, flags, content, msix_address):
> +    def __init__(self, id, extended, start, len, flags, content, msix_address):
>          self.id = id
> +        self.extended = extended
>          self.start = start
>          self.len = len
>          self.flags = flags
> @@ -556,6 +559,10 @@ class PCICapability:
>          return self.id == other.id and self.start == other.start and \
>              self.len == other.len and self.flags == other.flags
> 
> +    def gen_id_str(self):
> +        return str(self.id) + \
> +            (' | JAILHOUSE_PCI_EXT_CAP' if self.extended else '')
> +
>      RD = '0'
>      RW = 'JAILHOUSE_PCICAPS_WRITE'
> 
> @@ -580,11 +587,12 @@ class PCICapability:
>              msix_address = 0
>              f.seek(cap)
>              (id, next) = struct.unpack('<BB', f.read(2))
> -            if id == 0x01:  # Power Management
> +            id = PCI_CAP_ID(id)
> +            if id == PCI_CAP_ID.PM:
>                  # this cap can be handed out completely
>                  len = 8
>                  flags = PCICapability.RW
> -            elif id == 0x05:  # MSI
> +            elif id == PCI_CAP_ID.MSI:
>                  # access will be moderated by hypervisor
>                  len = 10
>                  (msgctl,) = struct.unpack('<H', f.read(2))
> @@ -593,7 +601,7 @@ class PCICapability:
>                  if (msgctl & (1 << 8)) != 0:  # per-vector masking support
>                      len += 10
>                  flags = PCICapability.RW
> -            elif id == 0x10:  # Express
> +            elif id == PCI_CAP_ID.EXP:
>                  len = 20
>                  (cap_reg,) = struct.unpack('<H', f.read(2))
>                  if (cap_reg & 0xf) >= 2:  # v2 capability
> @@ -601,7 +609,7 @@ class PCICapability:
>                  # access side effects still need to be analyzed
>                  flags = PCICapability.RD
>                  has_extended_caps = True
> -            elif id == 0x11:  # MSI-X
> +            elif id == PCI_CAP_ID.MSIX:
>                  # access will be moderated by hypervisor
>                  len = 12
>                  (table,) = struct.unpack('<xxI', f.read(6))
> @@ -620,7 +628,7 @@ class PCICapability:
>                  flags = PCICapability.RD
>              f.seek(cap + 2)
>              content = f.read(len - 2)
> -            caps.append(PCICapability(id, cap, len, flags, content,
> +            caps.append(PCICapability(id, False, cap, len, flags, content,
>                                        msix_address))
> 
>          if has_extended_caps:
> @@ -637,8 +645,9 @@ class PCICapability:
>                            'Extended Capability ID %x' % id)
>                      continue
> 
> +                id = PCI_EXT_CAP_ID(id)
>                  next = version_next >> 4
> -                if id == 0x0010:  # SR-IOV
> +                if id == PCI_EXT_CAP_ID.SRIOV:
>                      len = 64
>                      # access side effects still need to be analyzed
>                      flags = PCICapability.RD
> @@ -648,8 +657,8 @@ class PCICapability:
>                      flags = PCICapability.RD
>                  f.seek(cap + 4)
>                  content = f.read(len - 4)
> -                id |= PCICapability.JAILHOUSE_PCI_EXT_CAP
> -                caps.append(PCICapability(id, cap, len, flags, content, 0))
> +                caps.append(PCICapability(id, True, cap, len, flags, content,
> +                                          0))
> 
>          f.close()
>          return caps
> @@ -674,9 +683,9 @@ class PCIDevice:
>          self.msix_region_size = 0
>          self.msix_address = 0
>          for c in caps:
> -            if c.id in (0x05, 0x11):
> +            if c.id in (PCI_CAP_ID.MSI, PCI_CAP_ID.MSIX):
>                  msg_ctrl = struct.unpack('<H', c.content[:2])[0]
> -                if c.id == 0x05:  # MSI
> +                if c.id == PCI_CAP_ID.MSI:
>                      self.num_msi_vectors = 1 << ((msg_ctrl >> 1) & 0x7)
>                      self.msi_64bits = (msg_ctrl >> 7) & 1
>                  else:  # MSI-X
> diff --git a/scripts/gen_pci_defs.sh b/scripts/gen_pci_defs.sh
> new file mode 100755
> index 00000000..40fb3a72
> --- /dev/null
> +++ b/scripts/gen_pci_defs.sh
> @@ -0,0 +1,44 @@
> +#!/bin/bash
> +#
> +# Jailhouse, a Linux-based partitioning hypervisor
> +#
> +# Copyright (c) OTH Regensburg, 2019
> +#
> +# Authors:
> +#  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2.  See
> +# the COPYING file in the top-level directory.
> +
> +CELL_CONFIG_H=$1
> +
> +function find_defines() {
> +	header=$1
> +	prefix=$2
> +	search="#define\s\+${prefix}\(\S*\)\s\+\(\S*\).*"
> +	replace="        '\1'\t: \2,"
> +
> +	grep $prefix $header | sed -e "s/$search/$replace/"
> +}
> +
> +PCI_CAP_IDS=$(find_defines $CELL_CONFIG_H PCI_CAP_ID_)
> +PCI_EXT_CAP_IDS=$(find_defines $CELL_CONFIG_H PCI_EXT_CAP_ID_)
> +
> +cat <<END
> +# This file is autogenerated. If you need to change it, edit
> +# tools/gen_pci_cap_ids.py.sh instead.
> +
> +from .extendedenum import ExtendedEnum
> +
> +
> +class PCI_CAP_ID(ExtendedEnum):
> +    _ids = {
> +${PCI_CAP_IDS}
> +    }
> +
> +
> +class PCI_EXT_CAP_ID(ExtendedEnum):
> +    _ids = {
> +${PCI_EXT_CAP_IDS}
> +    }
> +END
> diff --git a/tools/root-cell-config.c.tmpl b/tools/root-cell-config.c.tmpl
> index b80d7889..b6ac8637 100644
> --- a/tools/root-cell-config.c.tmpl
> +++ b/tools/root-cell-config.c.tmpl
> @@ -196,11 +196,7 @@ struct {
>  		/* ${comment} */
>  		% endfor
>  		{
> -			% if (c.id & 0x8000) != 0:
> -			.id = ${hex(c.id & 0x7fff)} | JAILHOUSE_PCI_EXT_CAP,
> -			% else:
> -			.id = ${hex(c.id)},
> -			% endif
> +			.id = ${c.gen_id_str()},
>  			.start = ${hex(c.start)},
>  			.len = ${c.len},
>  			.flags = ${c.flags},
> --
> 2.16.4
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ea00d0ad-2353-71d9-1a9a-62b5f0cb4376%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
