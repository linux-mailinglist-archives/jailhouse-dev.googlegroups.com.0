Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB7UF63TQKGQEI3AJF5A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1B43AC2D
	for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Jun 2019 00:06:55 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id p14sf12272357edc.4
        for <lists+jailhouse-dev@lfdr.de>; Sun, 09 Jun 2019 15:06:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560118014; cv=pass;
        d=google.com; s=arc-20160816;
        b=Xzbgg4CDNcdxTgmOEsMYt1pLAH0/KTClHZk+D+b9dV92P/fsRkpMIOVCi+Lzoypydz
         gCszqRONrS9eTmWHMP6xlCEHrp+svqdVi27ujlu7P1QjIZZcxDHRs4pv26jzXHDnC4cM
         68MnOKdBwkHE+qmmV6RbD3crqbDRtPbCFBee5DTd9VnLCuyBleRqQgnx9QDLOmGJeM/I
         ukgIWyICG/qrz6pu5p1XmownERCUJr3ddXeQhIbPfrJfLrD85UZ62lWTdF/SRVX6lfN9
         v1ZXu0ze9pnbucwAzV4YPiK5QGKUvj1Pct9G4XzUytkTWxcwUZWu+cUHl2eOyWX33gP2
         +tIw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:subject:autocrypt:openpgp:from:references:to:sender
         :dkim-signature;
        bh=rati1Fpk2z1RD9iZmkw2cdnZI8+ZFqcjbSAYL4VWVuc=;
        b=Zhupgs7wb8QwsAO58B7UcmFiu9GHKGT0PabS7nGYT8EDCCewG9EBKFt6+IfUZSgLKO
         30AjShPSjWqTz1d1OanpVahTjPOZL7gerSw4hWX+aucRQTk0PnS6GfiffuJm38lg5lUF
         fv0R0z7SApL3evZcw7VefEKYi9PEi/Pdi5x+yOafUHSHACU127LCNOVPC8mIFK6aID4m
         kULOWJVicWwZV1u//rOfBWVnT2SUdZ/uqIH5h2wNU873hIWui3z3rYdz8n3NNiVWV+MN
         XkKgltz8S31hW5OsiaZWsRnvZzso+eVOVubpyYehrpa+IxZUqvchURZtOLwzbiOOMpJE
         dVvg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=qOxr4p+x;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:references:from:openpgp:autocrypt:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=rati1Fpk2z1RD9iZmkw2cdnZI8+ZFqcjbSAYL4VWVuc=;
        b=lsEVdh05b+Gk/4dcB3aTMVrbbEbyjJSTF5jtsoWv63K9qvdUUIA0qcLaJCJ6/GrKbR
         Sn0nsSMgCDg/+kMO+X9kyFJS/BZHMzzuCmAU1Zao/1f5UuuDv4sfFAdQ6H+6uK67OSlw
         nczKxOvmOWHro9nq4INFNJKKC5HwG3wQgoUPuf4qT+8vbrXBl0+r9eHDBjjO5iVNuP5R
         EzjvHD/4e40JLe9PtcMnDnRP2WD40X7CCLIxWe0q1UcTDEgGCqZ88LemuoRls/EOoN1Z
         mv7tcpZCrg7+Mo0fZ6JldHWY1UFfG+lT/oh3EYE67dnRLIGiUcWSkKkzSS4vjV5P4M+K
         mgug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:references:from:openpgp:autocrypt
         :subject:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rati1Fpk2z1RD9iZmkw2cdnZI8+ZFqcjbSAYL4VWVuc=;
        b=WZ/2msBej+x/LGzvGebnJn5VGWucSTbl/b+b5RQHThMQ4l1bjksD3dYYzryWb4Bp4Y
         ENB21pgp/fwLNX/ao+Kr8TiLOcse6ZicB63rSO58OS0KKe+yyfgPjy/keGrje9UZZ1ML
         Otutd8qRpBxq4dpZLRrxu7jMygiGV8rZuafdSo68owdQtDjQUVfEB4J6R/0KDgBdjcxj
         021NvEpnb6ND7mv+X6SfXiFMk32GC6ZGrqCgQhncF51ztXfMrQLpKQLR4qt7+rRI1O6T
         fjZ7jeqnzU04w639mOHwmybzRXqD/GsJm3gMRtNzg3gmBwdjxmqEho7MWT+7IZpkL3mN
         o49A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV/Dii90/zIYyN+DVvCZJQqwzmj8e6xfejkVmtOzl3m7l7dPeMF
	OcdMLundduZUpW1Wa3vPa3E=
X-Google-Smtp-Source: APXvYqwzQv38QeHO11uFyDUBshmURyXu2UxaKMiXsfa26ThBspI7O9Cdn/Ymfnta/ZIBcKuzS2VUQw==
X-Received: by 2002:a05:6402:64a:: with SMTP id u10mr29009778edx.35.1560118014827;
        Sun, 09 Jun 2019 15:06:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:cac7:: with SMTP id f7ls4091169edi.4.gmail; Sun, 09 Jun
 2019 15:06:54 -0700 (PDT)
X-Received: by 2002:a50:972a:: with SMTP id c39mr34934389edb.46.1560118014285;
        Sun, 09 Jun 2019 15:06:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560118014; cv=none;
        d=google.com; s=arc-20160816;
        b=P38Im+ylGlYdx8RDY1ALJ7USf2MCJzg4I13Y7P4aANv4k5wusjjW4o3Vo2SY0Ax+u2
         3R0QlZIMQjWwjoAyLVeEnZZeM3YLJuvrOouq5EYoGjcdFOYTFr5fMLkJNNfOjzZYEp0A
         EC5AQ2B3rHePZn01UPkmZrmAfoobGuA1Vh3ARHno7iP7FMu6ZpewvtOJ3Y01DY9KaKj5
         CyMm7ktjoUs/exdAXGOQf1zKQbzyyS8Sf94FOMYMsly+56CzY1JL+GQjA02UfT0YS/iC
         l1l0enOsMq+Hj6DyAtHdmtQVipE3iK07IBRHbd4Zy5ioPNunyd0IRy/Hy6Vu0Dx6ANjI
         PFGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:subject:autocrypt:openpgp:from
         :references:to:dkim-signature;
        bh=t5fe+CjmAJLdN9NU3L6ieWjPxKLEH3i9VOhiP086Ym0=;
        b=s+BS4tzs8LGP6eC5JqeykDnnDEJ1OPEpI9r2xeKqYWaRu8AmXtJcJyXx1KwkI1ubjQ
         IG5gbi2VTSefKW4mqe5UwvjTCc6zVkm9Fi7LCFUTSqy0jvtTHWfeude0GBxnW0+tX+MA
         J+h5/cDdawGvJWkn9bTNnxoFEr3EZs6pcLc0uKXLMSw2HTN7LFP1zRhwfyJp3l3JWpUI
         9v8pA5O3kIiCwZoAuedM0M1lcSFxXA5gw+T2VnUu6h5mkaCrTBIFIKwhW0Weu6HVM9xX
         fSeR0u36bGwev46dePE5j7x61ZmeDXMvZYKUxhLVch8opWO6U5OpzcUI8WSNaJZIp9cT
         0aCg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=qOxr4p+x;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id o1si445054edc.2.2019.06.09.15.06.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Jun 2019 15:06:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 45MVjT4XlZzyHd;
	Mon, 10 Jun 2019 00:06:53 +0200 (CEST)
Received: from [172.23.3.82] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 10 Jun
 2019 00:06:53 +0200
To: Jan Kiszka <jan.kiszka@web.de>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190103180651.8171-1-ralf.ramsauer@oth-regensburg.de>
 <20190103180651.8171-9-ralf.ramsauer@oth-regensburg.de>
 <da6e4ea8-5b0f-c3c9-d2fb-3dfed845f158@web.de>
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
Subject: Re: [PATCH v3 08/13] arm64: Initialise SMCCC backend
Message-ID: <d48f69f1-77d0-a76c-6883-52de524a178d@oth-regensburg.de>
Date: Mon, 10 Jun 2019 00:06:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <da6e4ea8-5b0f-c3c9-d2fb-3dfed845f158@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=qOxr4p+x;
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



On 6/9/19 3:37 PM, Jan Kiszka wrote:
> On 03.01.19 19:06, Ralf Ramsauer wrote:
>> by discovering its features.
>>
>> The first step is to check the PSCI version. Don't even try to do any
>> SMCCC calls without having checked the proper PSCI version (current QEMU
>> horribly crashes).
>>
>> Probe if SMCCC_ARCH_FEATURES is available. If so, probe for
>> SMCCC_ARCH_WORKAROUND_1 and expose its availability by setting a flag
>> inside the percpu structure.
>>
>> The availability is stored per-cpu, as we might have big.LITTLE systems,
>> where only a subset of cores need mitigations.
>>
>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> ---
>> =C2=A0 .../arch/arm-common/include/asm/percpu.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 3 ++
>> =C2=A0 .../arch/arm-common/include/asm/smccc.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 5 +++
>> =C2=A0 hypervisor/arch/arm-common/setup.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++
>> =C2=A0 hypervisor/arch/arm-common/smccc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 32 +++++++++++++++++++
>> =C2=A0 .../arch/arm/include/asm/percpu_fields.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 1 +
>> =C2=A0 .../arch/arm64/include/asm/percpu_fields.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0 1 +
>> =C2=A0 6 files changed, 45 insertions(+)
>>
>> diff --git a/hypervisor/arch/arm-common/include/asm/percpu.h
>> b/hypervisor/arch/arm-common/include/asm/percpu.h
>> index b9278117..4b37e1be 100644
>> --- a/hypervisor/arch/arm-common/include/asm/percpu.h
>> +++ b/hypervisor/arch/arm-common/include/asm/percpu.h
>> @@ -15,6 +15,9 @@
>>
>> =C2=A0 #define STACK_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 PAGE_SIZE
>>
>> +#define ARM_PERCPU_FIELDS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0 bool smccc_has_workaround_1;
>> +
>> =C2=A0 #define ARCH_PUBLIC_PERCPU_FIELDS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long mpidr;=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 \
>> diff --git a/hypervisor/arch/arm-common/include/asm/smccc.h
>> b/hypervisor/arch/arm-common/include/asm/smccc.h
>> index 563ab9ef..6c490fad 100644
>> --- a/hypervisor/arch/arm-common/include/asm/smccc.h
>> +++ b/hypervisor/arch/arm-common/include/asm/smccc.h
>> @@ -12,6 +12,8 @@
>>
>> =C2=A0 #define SMCCC_VERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0x80000000
>> =C2=A0 #define SMCCC_ARCH_FEATURES=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x80000001
>> +#define SMCCC_ARCH_WORKAROUND_1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x80008000
>> +#define SMCCC_ARCH_WORKAROUND_2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x80007fff
>>
>> =C2=A0 #define ARM_SMCCC_OWNER_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 BIT_MASK(29, 24)
>> =C2=A0 #define ARM_SMCCC_OWNER_SHIFT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 24
>> @@ -33,4 +35,7 @@
>>
>> =C2=A0 #define SMCCC_IS_CONV_64(function_id)=C2=A0=C2=A0=C2=A0 !!(functi=
on_id & (1 << 30))
>>
>> +struct trap_context;
>> +
>> +void smccc_discover(void);
>> =C2=A0 enum trap_return handle_smc(struct trap_context *ctx);
>> diff --git a/hypervisor/arch/arm-common/setup.c
>> b/hypervisor/arch/arm-common/setup.c
>> index 4cc045ec..2a04cdb7 100644
>> --- a/hypervisor/arch/arm-common/setup.c
>> +++ b/hypervisor/arch/arm-common/setup.c
>> @@ -14,6 +14,7 @@
>> =C2=A0 #include <jailhouse/paging.h>
>> =C2=A0 #include <jailhouse/processor.h>
>> =C2=A0 #include <asm/setup.h>
>> +#include <asm/smccc.h>
>>
>> =C2=A0 static u32 __attribute__((aligned(PAGE_SIZE)))
>> parking_code[PAGE_SIZE / 4] =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM_PARKING_CODE
>> @@ -42,5 +43,7 @@ int arm_cpu_init(struct per_cpu *cpu_data)
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm_paging_vcpu_init(&root_cell.arch.mm);
>>
>> +=C2=A0=C2=A0=C2=A0 smccc_discover();
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return irqchip_cpu_init(cpu_data);
>> =C2=A0 }
>> diff --git a/hypervisor/arch/arm-common/smccc.c
>> b/hypervisor/arch/arm-common/smccc.c
>> index 211d6cd7..37c05b42 100644
>> --- a/hypervisor/arch/arm-common/smccc.c
>> +++ b/hypervisor/arch/arm-common/smccc.c
>> @@ -11,10 +11,42 @@
>> =C2=A0=C2=A0 */
>>
>> =C2=A0 #include <jailhouse/control.h>
>> +#include <jailhouse/printk.h>
>> =C2=A0 #include <asm/psci.h>
>> =C2=A0 #include <asm/traps.h>
>> +#include <asm/smc.h>
>> =C2=A0 #include <asm/smccc.h>
>>
>> +void smccc_discover(void)
>> +{
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D smc(PSCI_0_2_FN_VERSION);
>> + > +=C2=A0=C2=A0=C2=A0 /* We need >=3DPSCIv1.0 for SMCCC */
>> +=C2=A0=C2=A0=C2=A0 if (PSCI_VERSION_MAJOR(ret) < 1)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>> +
>=20
> This breaks on ARMv7, at least on sunxi (Orange Pi Zero). I first
> thought it was
> because U-Boot returning -1, instead "0.2". But then it turns out that
> the smc
> itself does not return. I'm starting to believe we do not get the call
> through
> the hyp stub of the kernel, which is still active during smccc_discover
> on ARMv7
> (in contrast to ARMv8, where we take over first).
>=20
> Do we support fixing on ARMv7 at all? Otherwise, the invocation of this
> should
> be moved to ARMv8 only.

Not yet. I have to check if mitigations are already supported/available
on ARMv7. I'll try to find some time to implement mitigations if available.

>=20
> Jan
>=20
> PS: This change was untested on the Orange Pi until today and my attempt =
to
> demonstrate jailhouse next during a live demo at MiniDebConf...

Too bad, I'm sorry. I hope you were able to jump over to a working
checkout. But you took the risk of an untested next. Which reminds us of
the lack of continuous testing...

  Ralf

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/d48f69f1-77d0-a76c-6883-52de524a178d%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
