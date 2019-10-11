Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBHPIQLWQKGQEUPQGESA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 17605D45E0
	for <lists+jailhouse-dev@lfdr.de>; Fri, 11 Oct 2019 18:55:58 +0200 (CEST)
Received: by mail-ed1-x537.google.com with SMTP id s29sf6108593eds.21
        for <lists+jailhouse-dev@lfdr.de>; Fri, 11 Oct 2019 09:55:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570812957; cv=pass;
        d=google.com; s=arc-20160816;
        b=q4DgPHI127F+66px8suXx5lFcHvGvkuRkxHvHDr1O9ayVNvsvm91RwOPl179uowdhf
         I14OMJuxGhVJE9JqMANi0XpAMHTph2/E9FQDxWpX1FuHA/E5EabI/oyvLfsPOOp54Sdu
         hqsf/dpSVcmI+599deXjRkn0Miwpn9OMMfFRVBciZLyAr6qPsLCw9Y+QZh1yAeMF1BwN
         1pBczarEBtFSrp1ZAjUDPhqF3uNbGdBaQhOw9JXX8Ryyu3UfDQr5vMyLrsfusB8HBEZZ
         gTxPGfkcMtIJDH3AqwQg/Pft4iZRia/B3hCotnqayDRTw39ltD7VAcgq661grRE8aad/
         ZaGA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:subject:autocrypt:from:references:to:sender
         :dkim-signature;
        bh=rjIZwLXu8Lc8jnRBzYYE5UJ49sf1I8n67W1KpEP1CfQ=;
        b=oyDhGTgUi9xGCWL6qs9OjfDqz6EK4lQB9URdE90mAzSy//NCFDGpv6qrIEIJxA2bU+
         HTE34Jf89qKp9eTpkIGMlhGR9Ld3XFJ+GqD0DJfUvl9qLKk6Z2bKZ6SyI9Vun7hrqcpc
         MWCWCnTSy76BoSJBn0zK6aQTaFgQ0iOX1syQUdZjjPxlRWiIEXd0sy9sukzr9Lveh+eh
         b3HTAXWY8wZXCeiP2u/pxejK5SoyQaYcAJ7wlFXkADQ4sYH4Q14K0TMKvOddqZjetlKa
         nS0uiNXR2igV46HImNjEu0z7r5ycuYKwNDOWzPbM718MGcMDvL/8KLGZe23mOYOPZKJo
         gclg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=XnnrBwyJ;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:references:from:autocrypt:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=rjIZwLXu8Lc8jnRBzYYE5UJ49sf1I8n67W1KpEP1CfQ=;
        b=bg96ZjoviNh4vk1cAFjcbNBnnDZktDw2jA6QGjM70k5tgd4F7dLmeLbsddULy4MT1Q
         p5fjaMyUxf3BXXaR94s7U+57+ytwWzRsMEp52LkFsd7UYB4RekwMePa8OnWcHpLbCq7c
         Nbv8o/7h68Kl0voxw0zP8y+li2KYgv0KduPUPnnGFu7KdXeLxWRLNFQezej78rQD5NGm
         m/W5E2cnq3vijY64CEHCFr20YiWuTNVYrHjvAG5m7a9KsxARbz2WTl1TZBE9XAtV+8l4
         POh/2FyTTuuKWPJ9sj/hMMpRn5C3TZWj7Zn9cpHv0ih9vq8EfMMDkU7M/6leDn82Nd58
         YgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:references:from:autocrypt:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rjIZwLXu8Lc8jnRBzYYE5UJ49sf1I8n67W1KpEP1CfQ=;
        b=Y57ADGNbyP4gkF0Tk72CWA9+9yjz44FRo2ns8/AqaOa5zoQarkLSoKIdT+cLt9UAkF
         T2HBKYmcOhGQHTgo3tBVDYqFzTyPL7Wv1JTA48+Fnejg+yHgCEzhFpTq5RHmUgBt0Tug
         jK7WXnarFxxn1Pt0cLdpME+etEdd82A57YKPtaywQzuDBKgHu/WkxogfOI2esMk+1q1A
         xj1cUMfsBKbp2eyofWGuuQgZ/sAZwbxV9z4d7FElWfOAFzJkchIEAXUkKCC7KjQrZz8d
         sLhZXgq+Vyj2Wi+jhLRph7fecwz11sy4iiWYUJvDtpRnfv2r81AP1hksJt92C0BMtNzh
         6OWw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXwFXonAnkflysmYKMNSIgNxHW5T7cKBE0rkGetrzznGijw+zRo
	dD9IjR4eC0envEX/Y/xT1L0=
X-Google-Smtp-Source: APXvYqx/FzWmmkjpxflzXOLpzYDHeoiEuM40MXYFcCQAux1TPhczoG3iep+WSsfB/uXpmB6WtNEXFg==
X-Received: by 2002:a17:906:3385:: with SMTP id v5mr14794845eja.154.1570812957726;
        Fri, 11 Oct 2019 09:55:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:ace6:: with SMTP id x93ls1874876edc.6.gmail; Fri, 11 Oct
 2019 09:55:57 -0700 (PDT)
X-Received: by 2002:aa7:dd0f:: with SMTP id i15mr15169053edv.0.1570812957080;
        Fri, 11 Oct 2019 09:55:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570812957; cv=none;
        d=google.com; s=arc-20160816;
        b=PKThHoy8gdFHfzamNCXIhEPZQeL7rOdojxxr5GMcPfgKoRA7mz+FQOqeef13/ZWbyW
         4aYHZsAkv3FNdiTmLAs6NVaW7CyyjpfSFGQhqWUPJkYN6OYrVlxZNdmbiMVIFZzjONvh
         tW41G3lJB3vVkkfahsATN+catpGqhHckeMdcTKbOVZ/6zS9nn4BK5oYyEwRDAhByM3HS
         1FzPZpIEE/rEU3W7+HQQ0qcMNwC8m5G6R97/MeRxLxKvurkwL22DGDgN4cHDo0NFV2vR
         yKeDH0h+f/atxINiqeMlgEsSuzDxPXU9r9X7XwagoPaDUbjvq6i/kNCY6IybbgBb1LKf
         f4XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:subject:autocrypt:from:references:to
         :dkim-signature;
        bh=L0ct/5K8yD7JY/avVIJRBsKU2r6ANjtS4uJB15OD834=;
        b=0F18xtHKIgt40Gc9KmgMipxbwk++JPdPnWLGX04f1lK/QyYosZi7316YwVqdvVKI4J
         0raq665C82liG7ZaqZrvK+DYDnuwqAsk75AFA7Nfmb8dugp/jMacKUYdWeRgHGw2aMnn
         P5PPLH5/7y7WQdZEqos29xxmWXftGCBNQIZfmk/SAv29gYochPT7zs7YK3H5U1Gu6hD8
         oNibrGNNORraAnl9F4jAT+YmsLarDvqBOMiRb/8FPNMlPJsSqiAZxhtqCsjjXzxPq5zH
         ZxyzBWaiDhEREGW5Ew/prE6IDtbI++tR+PAltnI96hE6B+1qdfJ31yLF+1YVnK4RUari
         aU0Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=XnnrBwyJ;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id y11si90556edq.1.2019.10.11.09.55.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Oct 2019 09:55:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 46qYxS46K7zxys;
	Fri, 11 Oct 2019 18:55:56 +0200 (CEST)
Received: from [172.16.2.24] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Fri, 11 Oct
 2019 18:55:56 +0200
To: Jan Kiszka <jan.kiszka@siemens.com>, Vitaly Andrianov <vitalya@ti.com>,
	<jailhouse-dev@googlegroups.com>
References: <1570731650-5335-1-git-send-email-vitalya@ti.com>
 <1570731650-5335-4-git-send-email-vitalya@ti.com>
 <0b85c51a-0078-47fb-70ba-a8f9def7b852@siemens.com>
 <357f2bee-176a-af2c-e603-9f907f1594a0@siemens.com>
 <a2ca04dc-8212-1e0b-c3dc-f3b58fc2cb12@oth-regensburg.de>
 <32d719ab-04f9-f57a-d8b1-33f6467da855@siemens.com>
 <f5316d70-5f44-93e0-dc2f-604cdd229fc6@oth-regensburg.de>
 <b3477139-cfe2-b8af-8b42-11487e4e4c87@siemens.com>
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
Subject: Re: [PATCH 3/4] arm: am57xx: introduce support for TI am57xx SOC
Message-ID: <0368a897-9bda-63fe-5657-89891422c118@oth-regensburg.de>
Date: Fri, 11 Oct 2019 18:55:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <b3477139-cfe2-b8af-8b42-11487e4e4c87@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=XnnrBwyJ;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

On 10/11/19 6:41 PM, Jan Kiszka wrote:
> On 11.10.19 18:30, Ralf Ramsauer wrote:
>>
>>
>> On 10/11/19 6:13 PM, Jan Kiszka wrote:
>>> On 11.10.19 18:09, Ralf Ramsauer wrote:
>>>>
>>>>
>>>> On 10/11/19 5:37 PM, Jan Kiszka wrote:
>>>>> On 11.10.19 17:24, Jan Kiszka wrote:
>>>>>> On 10.10.19 20:20, 'Vitaly Andrianov' via Jailhouse wrote:
>>>>>>> This commit introduces support for TI AM57xx SOC. Original support
>>>>>>> was done
>>>>>>> by Jan Kiszka for v0.7 version, but wasn't upstreamed yet.
>>>>>>>
>>>>>>
>>>>>> This lacks a design description. Even for me, because I always
>>>>>> need to
>>>>>> recall the non-trival logic here.
>>>>>>
>>>>>> IIRC, SMP cores on that platform are brought up during boot by
>>>>>> writing
>>>>>> their continuation address into a mailbox (OMAP_WKUPGEN_BASE +
>>>>>> OMAP_AUX_CORE_BOOT_<CPU>). They stay in that WFE state - how do we
>>>>>> kick them out of this, normally as well as while under Jailhouse
>>>>>> control? Where does the code for this checker loop come from when
>>>>>> Jailhouse is in charge? Should Jailhouse better provider it, like we
>>>>>> do on x86 (look for parking_code)?
>>>>>>
>>>>>> For reference (should ideally go into the commit log or some comment
>>>>>> as well): AM572x TRM, section "33.3.4.1. Startup".
>>>>>>
>>>>>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>>>>>> Signed-off-by: Vitaly Andrianov <vitalya@ti.com>
>>>>>>> ---
>>>>>>> =C2=A0=C2=A0=C2=A0 hypervisor/arch/arm/Kbuild=C2=A0=C2=A0 |=C2=A0 2=
 +
>>>>>>> =C2=A0=C2=A0=C2=A0 hypervisor/arch/arm/am57xx.c | 98
>>>>>>> ++++++++++++++++++++++++++++++++++++++++++++
>>>>>>> =C2=A0=C2=A0=C2=A0 2 files changed, 100 insertions(+)
>>>>>>> =C2=A0=C2=A0=C2=A0 create mode 100644 hypervisor/arch/arm/am57xx.c
>>>>>>>
>>>>>>> diff --git a/hypervisor/arch/arm/Kbuild b/hypervisor/arch/arm/Kbuil=
d
>>>>>>> index e1bec1b..2ef89c3 100644
>>>>>>> --- a/hypervisor/arch/arm/Kbuild
>>>>>>> +++ b/hypervisor/arch/arm/Kbuild
>>>>>>> @@ -26,3 +26,5 @@ lib-y +=3D mmu_hyp.o caches.o
>>>>>>> =C2=A0=C2=A0=C2=A0 #=C2=A0 gcc7 will bring a new function attribute
>>>>>>> "no_profile_instrument_function"
>>>>>>> =C2=A0=C2=A0=C2=A0 #=C2=A0 should switch to that for higher granula=
rity, but gcc7 is not
>>>>>>> even there
>>>>>>> =C2=A0=C2=A0=C2=A0 CFLAGS_mmu_hyp.o +=3D -fno-profile-arcs -fno-tes=
t-coverage
>>>>>>> +
>>>>>>> +lib-$(CONFIG_MACH_AM57XX) +=3D am57xx.o
>>>>>>> diff --git a/hypervisor/arch/arm/am57xx.c
>>>>>>> b/hypervisor/arch/arm/am57xx.c
>>>>>>> new file mode 100644
>>>>>>> index 0000000..1aa2328
>>>>>>> --- /dev/null
>>>>>>> +++ b/hypervisor/arch/arm/am57xx.c
>>>>>>> @@ -0,0 +1,98 @@
>>>>>>> +/*
>>>>>>> + * Jailhouse, a Linux-based partitioning hypervisor
>>>>>>> + *
>>>>>>> + * Copyright (c) ARM Limited, 2014
>>>>>>> + * Copyright (c) Siemens AG, 2016
>>>>>>> + * Copyright (c) Texas Instruments Incorporated, 2019
>>>>>>> + *
>>>>>>> + * Authors:
>>>>>>> + *=C2=A0 Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
>>>>>>> + *=C2=A0 Jan Kiszka <jan.kiszka@siemens.com>
>>>>>>> + *=C2=A0 Vitaly Andrianov <vitalya@ti.com>
>>>>>>> + *
>>>>>>> + * This work is licensed under the terms of the GNU GPL, version 2=
.
>>>>>>> See
>>>>>>> + * the COPYING file in the top-level directory.
>>>>>>> + */
>>>>>>> +
>>>>>>> +#include <jailhouse/control.h>
>>>>>>> +#include <jailhouse/mmio.h>
>>>>>>> +#include <jailhouse/printk.h>
>>>>>>> +#include <jailhouse/unit.h>
>>>>>>> +#include <jailhouse/percpu.h>
>>>>>>> +#include <asm/control.h>
>>>>>>> +#include <asm/psci.h>
>>>>>>> +#include <asm/smccc.h>
>>>>>>> +#include <asm/setup.h>
>>>>>>> +#include <asm/traps.h>
>>>>>>> +#include <asm/sysregs.h>
>>>>>>> +
>>>>>>> +#define OMAP_WKUPGEN_BASE=C2=A0=C2=A0=C2=A0 0x48281000
>>>>>>> +#define OMAP_AUX_CORE_BOOT_0=C2=A0=C2=A0=C2=A0 0x800
>>>>>>> +
>>>>>>> +const unsigned int smp_mmio_regions;
>>>>>>
>>>>>> Unused.
>>>>>>
>>>>>>> +
>>>>>>> +static void *wkupgen_base =3D NULL;
>>>>>>> +
>>>>>>> +static int am57xx_init(void)
>>>>>>> +{
>>>>>>> +=C2=A0=C2=A0=C2=A0 wkupgen_base =3D paging_map_device(OMAP_WKUPGEN=
_BASE, PAGE_SIZE);
>>>>>>> +
>>>>>>> +=C2=A0=C2=A0=C2=A0 return (wkupgen_base =3D=3D NULL) ? -ENOMEM : 0=
;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static int am57xx_cell_init(struct cell *cell)
>>>>>>> +{
>>>>>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>>>>>> +}
>>>>>>> +
>>>>>>> +void suspend_cpu(unsigned int cpu_id);
>>>>>>> +static void am57xx_cell_exit(struct cell *cell)
>>>>>>> +{
>>>>>>> +=C2=A0=C2=A0=C2=A0 unsigned int cpu;
>>>>>>> +=C2=A0=C2=A0=C2=A0 for_each_cpu(cpu, cell->cpu_set) {
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 public_per_cpu(cpu)->cp=
u_on_entry =3D
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 mmio_read32(wkupgen_base + OMAP_AUX_CORE_BOOT_0 +
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu * 4);
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 public_per_cpu(cpu)->cp=
u_on_context =3D 0;
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 suspend_cpu(cpu);
>>>>>>
>>>>>> Why do we need suspend_cpu? It is suspended when the cell destructio=
n
>>>>>> starts (via cell_suspend), i.e. before this call.
>>>>>>
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch_reset_cpu(cpu);
>>>>>>
>>>>>> This resumes the CPU already here. Partly explains my questions on
>>>>>> the
>>>>>> top: We have no signal, we kick the re-assigned root cell cores off
>>>>>> immediately.
>>>>>>
>>>>>> Start address is what Linux defined for its original boot by filling
>>>>>> OMAP_AUX_CORE_BOOT_<CPU>. We are lucky still being able to read this
>>>>>> value back above...
>>>>>>
>>>>>> There is really no signal we could take that Linux sends when
>>>>>> logically onlining the CPUs again after cell destruction?
>>>>>>
>>>>>> BTW, what happens when you manually offline a CPU before assigning i=
t
>>>>>> to new cell? Then the Jailhouse driver will not online it on
>>>>>> destruction, but we kick it off unconditionally, don't we?
>>>>>>
>>>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>>>> +}
>>>>>>> +
>>>>>>> +int arch_handle_smc(struct trap_context *ctx)
>>>>>>> +{
>>>>>>> +=C2=A0=C2=A0=C2=A0 unsigned long *regs =3D ctx->regs;
>>>>>>> +
>>>>>>> +=C2=A0=C2=A0=C2=A0 switch (regs[12]) {
>>>>>>> +=C2=A0=C2=A0=C2=A0 case 0x102:
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm_write_banked_reg(EL=
R_hyp, regs[0]);
>>>>>>
>>>>>> This is probably "API_HYP_ENTRY" for the kernel - is there an
>>>>>> official
>>>>>> name?
>>>>>>
>>>>>> My current understanding is that Linux runs this during
>>>>>> omap5_secondary_hyp_startup normally in the hope to be taking into
>>>>>> HYP
>>>>>> mode at the specified (r0) address. We simple jump there, but not in
>>>>>> SVC mode. Works by luck with Linux, right?
>>>>>>
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return TRAP_HANDLED;
>>>>>>> +=C2=A0=C2=A0=C2=A0 case 0x109:
>>>>>>
>>>>>> This is OMAP5_DRA7_MON_SET_CNTFRQ_INDEX according to Linux, and we
>>>>>> should leave some words why we can simply call that smc on behalf of
>>>>>> the guest. I added it back then because "then it works", not because
>>>>>> of "I fully understand what I'm doing".
>>>>>>
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile(
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ".arch_extension sec\n\t"
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 "push {r0-r12, lr}\n\t"
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 "mov ip,%0\n\t"
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 "mov r0,%1\n\t"
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 "smc #0\n\t"
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 "pop {r0-r12, lr}\n\t"
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 : : "r" (regs[0]), "r" (regs[12]));
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch_skip_instruction(c=
tx);
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return TRAP_HANDLED;
>>>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>>>> +
>>>>>>> +=C2=A0=C2=A0=C2=A0 if (SMCCC_IS_CONV_64(regs[0]))
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return TRAP_FORBIDDEN;
>>>>>>> +
>>>>>>> +=C2=A0=C2=A0=C2=A0 if (IS_PSCI_UBOOT(regs[0])) {
>>>>>>
>>>>>> This path is here because non-root Linux is told to use PSCI for SMP
>>>>>> management, right?
>>>>>>
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regs[0] =3D psci_dispat=
ch(ctx);
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch_skip_instruction(c=
tx);
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return TRAP_HANDLED;
>>>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>>>> +
>>>>>>> +=C2=A0=C2=A0=C2=A0 return handle_smc(ctx);
>>>>>>> +}
>>>>>>> +
>>>>>>> +DEFINE_UNIT_SHUTDOWN_STUB( am57xx );
>>>>>>
>>>>>> ...(am58xx);
>>>>>>
>>>>>>> +DEFINE_UNIT_MMIO_COUNT_REGIONS_STUB( am57xx );
>>>>>>> +DEFINE_UNIT( am57xx, "AM57XX" );
>>>>>>> +
>>>>>>>
>>>>>>
>>>>>> Jan
>>>>>>
>>>>>
>>>>> Oh, and there should also be a note on how this platform support is
>>>>> enabled (CONFIG_MACH_AM57XX...) and that, when it's on, the hyperviso=
r
>>>>> binary is no longer universal - which is currently the case.
>>>>>
>>>>> The risk with this approach is that the optional code will silently
>>>>> break over time because it is not part of the main tests. We had that
>>>>> with vexpress in the past.
>>>>
>>>> What about a flag in the system configuration?
>>>>
>>>> I'd rather prefer to keep an universal binary, instead of
>>>> re-introducing
>>>> compile-time switches for different configurations. It was some effort
>>>> to get rid of those switches, and at the moment, only debugging
>>>> switches
>>>> and inmate-related switches are left.
>>>>
>>>> Downside: Even if the unit wouldn't register itself if the flag isn't
>>>> set, the debug output would contain a confusing
>>>> "Initializing unit AM57XX" entry.
>>>
>>> It's not against the idea behind units, though. On Intel, we also launc=
h
>>
>> Sure, implementing this thing as an unit is fine. But the corresponding
>> debug output might mislead.
>>
>>> CAT, irrespective of hardware support.
>>
>> Never noticed, but true. However, "Initializing unit CAT... Skipped"
>> would be more intuitive. All we lack is a to allow ENOSYS as valid
>> return value in units.
>=20
> That's a much more complex beast because then you would also need to
> kick the unit out of its link-time created table, to be consistent.

... Or flag units as used in a simple bitmap. Iterators could then
respect that map. A simple unsigned should be totally sufficient. I'll
check that if I find some time...

Back to this patch:

There's another obstacle... The patch before adds weak attributes to
arch_handle_smc, and this one overloads the default implementation. If
we want to keep the binary universal, this needs to be solved as well.

  Ralf

>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/0368a897-9bda-63fe-5657-89891422c118%40oth-regensburg.de.
