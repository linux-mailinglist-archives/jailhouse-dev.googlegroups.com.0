Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB5XJWTVQKGQEQ5ZRPIY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0E7A5A8A
	for <lists+jailhouse-dev@lfdr.de>; Mon,  2 Sep 2019 17:27:51 +0200 (CEST)
Received: by mail-lj1-x23e.google.com with SMTP id g28sf2049632ljl.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 02 Sep 2019 08:27:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567438071; cv=pass;
        d=google.com; s=arc-20160816;
        b=KdSkBZ3D8Mce4kIq0bAHfr3vG9op0ubg+E5HgIS8TwMiWYBzT90dOJUILpg86pdYFb
         ojuYsnczTsyiCLZr1j+pHPCqBOcxF1t7YXAGBMed/aXmBK77qGRK1Wqs2y84Wle8Mw9R
         A1Mqz2PHuF6yuz7ofGw4GOKonA3TCZ73ww3B7JHrjUXdn6vj7BhDruUIyo7aIZNXIMiv
         u4+GmDvjn7OWa5jfEDMJheZSvHOgJjYymGopJi8FmkECBt3+3VU3JOJvvXaR0NncOSxf
         7C5Y7W5JkWtF6jkhRbwec8QkPuzmdKB/xHOl+HR43Kp0Hfy6rtb87pnrGvpk32SZrnUm
         L58A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:subject:sender:dkim-signature;
        bh=5e+CeD/RCpEy1XK/f1JiqR4pQKxLereNNw83kL6dBS0=;
        b=vCqE5qi0ZNyuFFCZLzx5yYnd8F9UsPMRZ3SFYJ2hcXVjDb+UagmIQl3WzA5/PC+s45
         Oxoysvcxa1568ii9selclRtwP6G9iTjoTeznBucG1EsdDE103QYSdkhOyIgNE7Lmqxb6
         N8hyniJAuf+OeDSykNpVFzds1rwKWzfD/y4HODcRNMexWpoPeOCz7YQCD8W7NCph2bID
         XPMRnKkDmO0ev7djxe2xg4HWkaZ6zbF3O1C/XCbBBgWrWHLME3vjaFFvqa9CJv5lx5Ce
         l76N+BLexgOgzbuvY+d9IY8vHcTRE/vHEk3M9ol2TkR8rtL9oODhsqW58aZy2lPoAno3
         Se9A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Nu6np3qM;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5e+CeD/RCpEy1XK/f1JiqR4pQKxLereNNw83kL6dBS0=;
        b=oYw984N0N/Y1bHu8+zT6hrRTUEG5K8LX7dDwv8z+WOaJLaK1ZTjB0eDsr98B9F5658
         01IXnj1a+VoUogtAhY5ZiwEeGRM/nVmXRLTOkxiEbd2+ZUPz4XzQJX+hI/Ptgq2TBPa4
         HeFPX+bx+sIDX4mcWVritG5huLXQaBqEM007Ks2KKLssQZX91wGVIeIUXbsZOzBQqgmL
         4hc/NYqfbqw+SjReu7TV72v/cj2pZLN0JyTqSw9WV5UHC5RIfmelwzZc6xKvC4+yyCWn
         Ckb8gaH4N/GVOdC4BLBdZaOCuYJnvb13UJidRwjpSf0B5zeLF9eaiGoZcF1/kMFRWHyq
         r2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5e+CeD/RCpEy1XK/f1JiqR4pQKxLereNNw83kL6dBS0=;
        b=e6MPvVjlgbHgeI49LCEjxCW0kz83v5iVZcetJTMKcAzFTUvHOcfis2rVMDWakefmeT
         Uy+AFHxwZfbxfacMs7bdKsDqwQBNzE4AJTf+FsC+YlqNvHMPOSZA1ucoohZ2f++9ir6z
         j/LLOOpeGo1k+tzLef9khSTYAOKceiYee6iXYEY7q+5388uHtGd6PoGChSeGNoff6m08
         agT5jfMPCElgfQ9aDDnoRviz61Vd5+ZQnejFZQ5cT4BrrQLhDPXxsIqZ3F6a31Uw0m06
         JspLYPCgTp9wchFsdSznkk/5TeX4nGHVDWFPLAZ+CC6mWl/6cInLg7+WTtOyGpJjHTgG
         ybSg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV0wnQgkO+8UPfKRHdszu5GhvqXo+SYt5FIsR6vanVvVVRp3hFF
	bkxVLq1vr1NrvuL4HB6k2uc=
X-Google-Smtp-Source: APXvYqy53fmXnJbecR0VwcYmopfdMS4CJyVih5YnkA6CxBfJjUgjBOCjv1v62JM/1MqF2ZT+/AqAtw==
X-Received: by 2002:a2e:a17a:: with SMTP id u26mr6799749ljl.137.1567438070907;
        Mon, 02 Sep 2019 08:27:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c396:: with SMTP id t144ls1218616lff.8.gmail; Mon, 02
 Sep 2019 08:27:50 -0700 (PDT)
X-Received: by 2002:ac2:4352:: with SMTP id o18mr3630871lfl.164.1567438070281;
        Mon, 02 Sep 2019 08:27:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567438070; cv=none;
        d=google.com; s=arc-20160816;
        b=uoaumqOpkKeaX9/SvTZxS/eJ67afCR9CzH4kZi7cbleAWy9E+fPGnGN9sezsKHJcJ9
         00LaW7d2lcXA8uiKv/KGSB/t40GNpE5aPVeomCn+1CcJTPtsqDIRaIfXNaSI2IR6ceg5
         BddTbmOR/7ug+ZbMKAtg2+IZaZM0j+Gd9qH5fbLFc4i74Y6w7b6BoSkLd35bm4bgASGC
         6DVtIL8EXPaO3Y6HHRUQ4c7nf4IiR0VSWGIpxNyOCp+3rtYJpFQiWbhlWca1Iqo9lT7m
         kFeF1Z0cwAEIFlrttWMHBnV3EhMMHpjJ0xI0gciAxZim4CuNlUlEfQ6MBAov0WxJGkGK
         6g7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :subject:dkim-signature;
        bh=KLA0ODajjY09CF1BQLkGH9qoJxc3ZHc0KecA7/8AEd4=;
        b=Y1rMvgIFVVwbDOhD7vkK8LLm/Ti9hykvf4ikfMeu51S7ohN3TZ4LC718ZAcafZRPvQ
         zriFI+/HNMzZvO89PF0k200HtGPx2MIHlX9SJCN7bSYbnVMI8JEGZ3YSBCzEXsOVuJnT
         3lcWaYACCNHNPPGq1mv36eqqQe5ePsdqszdgzznKGJoh5VYeQ4v6OlIrGcaLe+YXzj6p
         mIWOD8IMYLmSbT4egL2i3SDtMIFbaGS9Ru2V2apwg9fearsdyEl6cKLbNp88XBGZsUDb
         xCjcqRoaZ7uLZp9gfOr0c/1Mnjnl/w2DhBvTW1hq66IPTi3LKbd1iS5fYg9MSvAwU51s
         57yA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Nu6np3qM;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id s14si558093ljg.4.2019.09.02.08.27.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Sep 2019 08:27:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 46MYqm2JTdzy9v;
	Mon,  2 Sep 2019 17:27:48 +0200 (CEST)
Received: from [172.16.2.24] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 2 Sep 2019
 17:27:48 +0200
Subject: Re: Interrupt Latency in RTOS inmate cell
To: Nir Geller <nirgeller18@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <361d6548-e251-4e1e-a03b-cdcbfda1b67d@googlegroups.com>
 <bce2e24b-2063-4ce1-a1c9-c99efcd2ba5d@googlegroups.com>
 <20190902165120.7cc1048b@md1za8fc.ad001.siemens.net>
 <a3c23a6a-95ee-4baa-9714-229c84d9d5b7@googlegroups.com>
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
Message-ID: <53ebbcfc-be0b-ab8d-5cd2-477e01d1dafc@oth-regensburg.de>
Date: Mon, 2 Sep 2019 17:27:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a3c23a6a-95ee-4baa-9714-229c84d9d5b7@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Nu6np3qM;
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

Hi,

On 9/2/19 5:11 PM, Nir Geller wrote:
> CPUFREQ is set to performance, and I'm setting scaling_min_freq to the
> highest available frequency (1500000)
> CPU idling is disabled
> 
> Now I see that executing a simple "cat somefile" on the command line
> causes a spike in jitter

only for the first time or also for consecutive calls on the same file?
IOW, can you observe/trigger the spike when somefile is in your page cache?

Does the non-root cell share any devices with the root cell? (e.g. debug
UART)

  Ralf

> 
> On Monday, September 2, 2019 at 5:51:24 PM UTC+3, Henning Schild wrote:
> 
>     Am Mon, 2 Sep 2019 06:12:00 -0700
>     schrieb Nir Geller <nirge...@gmail.com <javascript:>>:
> 
>     > I created a kernel module that catches/releases a spinlock and
>     > disables/enables preemption, and it had no observable effect on the
>     > jitter, however,
>     > the operations insmod and rmmod definitely cause spikes in jitter.
>     >
>     > Any pointers?
> 
>     Do you have any power management features enabled in that Linux?
> 
>     Henning
> 
>     > Thanks.
>     >
> 
> -- 
> You received this message because you are subscribed to the Google
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send
> an email to jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/a3c23a6a-95ee-4baa-9714-229c84d9d5b7%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/a3c23a6a-95ee-4baa-9714-229c84d9d5b7%40googlegroups.com?utm_medium=email&utm_source=footer>.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/53ebbcfc-be0b-ab8d-5cd2-477e01d1dafc%40oth-regensburg.de.
