Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBWP7WOCAMGQE4OS6QGI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id E40AD370627
	for <lists+jailhouse-dev@lfdr.de>; Sat,  1 May 2021 09:14:33 +0200 (CEST)
Received: by mail-lf1-x13e.google.com with SMTP id x5-20020a0565121305b029019cde1790dfsf354366lfu.15
        for <lists+jailhouse-dev@lfdr.de>; Sat, 01 May 2021 00:14:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1619853273; cv=pass;
        d=google.com; s=arc-20160816;
        b=Yyu9mQuXcsMoDN5iDPl5/1H4TyaZdmI6+GH0M/190C+agCzkBL7DlrOf4Un6W3CHc1
         6+uRlaOYGPjSmG9FsSeP+O3ubZx/9hQwhfro3eNFrdBhNUol1/tO9QyvjJSP+1U269BV
         apTRTYEbQ8j7LY4tO79LhhlynIJrL3fmekCu2AWmdb/hdRhhcbGAT1JsevWnZCBoLRzY
         IWwYP36oeXruvF+yAiNTVGXudkEIExm+MB+KAqk3Nz24jp/DCm0ZSnL7Ec/Sg45n+bn/
         ctKuA4NRTIbHbHHIKdx4rLq4JAGr1vEt/93U9G4Aa2QvNdCBV0tAJYQCWBmubpY5ZKms
         S1yg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=8zPvocPoWMhGJn3L0bWCNRYVpaazLTgKzN+wYf/2OuA=;
        b=HBavLVYhvZBytyA01TBI5ZdTp8c7wI/qxLzE7CJQIBJDIGfnS+5N2hDUliu7Diz5cL
         Vpkf733PxZ4wVg3wWkuwcRm0GC+rRSFVE6L9KkFOo7NWSu7iC0I9ZCetiNjdPzBsdCKd
         FeEpxQNk8d7Ktlp4AhRl5x8ASpmNLMTZzYnaJWMa3WZHSrFidWAK2PH/AL1onpoP0yMN
         fhh+FIp855RNMxneFH15wwU8Xk6dwq+AOnrFlhlZsi9AuYF4NMHXS8Im3ySlxuTNWrTX
         gWIIe3B4RzBu2C2Tnj9pbbYUJ2/ajGMEKwSKjqDh1Mk1u0zubqdmRrDQgUTtustv+DTL
         2Yaw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=SGZf5ZIC;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8zPvocPoWMhGJn3L0bWCNRYVpaazLTgKzN+wYf/2OuA=;
        b=hyFgAn0Y5sWWsVMaKZjU4XxOogVRNuBAvXUPSQchsvWTK3zUPy1zuABdwZxEqTQX/X
         3b4kwr0La1eZxctAMLF2ungmqiZt1S1PBeImfvYX0GNcYdG6y65Vl/ObnUA2uckysW5R
         0xciSLVoTXeP33Att9DnHf3FOmzGIDyB8XGqhOf0pXjGfyUEggezf+rLYDJKogBign/3
         BJszX66ivxm35pBcV12v2HGzNH9k8Mjc9gHj4iDeM/zojDgTTuXXJMfS8pkmDyOI+H+C
         m8V/A+YeNE0Ur1q3qmqdCor3ENC34X+UffaqSoLKWf4rjDZysgajiG7K4xxFuXDdehE/
         5g1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8zPvocPoWMhGJn3L0bWCNRYVpaazLTgKzN+wYf/2OuA=;
        b=aJEJqbLa4XXluOmys6APUHaeGJohM/Z7/Ahc9ja/bwhuN6+iRcRQF73xFbD9wJ3OmN
         j+5wbOx0TQQLMu2yRLNfp7mkqquRG5AcV4tyRagg11MHUBhdZAo6o3L1NCMnxYCJX9Ui
         U1gV2E6xhch5IBLY7anOfrEEXLAh4a7GLEgxlZJn9dkiuZvrozSDaQuFZxI5JwnesSZh
         fg/dUX5IYoXJ5f99CT3wRsuWVdN5RxnKYEHlvGvDkc2jUHBWcqQtucOK3uDW7GtvFx2C
         jd4ARiY62B0LQW/rpDv53PHgNqpl7Ry7QjvHwf5GZmoV73aGQRfrVvN446F4n3+Itc1f
         Y6lA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533CN8vVB+Q6MEgejEweGgDzClka31yRnqDJklX8jIDMaSxne3Dn
	uznFbPw985av+D+YcfMqHGY=
X-Google-Smtp-Source: ABdhPJyWO1kd7gRhpLyxw+TwF8ark5J8pc3ZrpR8eQd46WIm+3Ys2oSBkYYflgXerXtr22EP/g+83Q==
X-Received: by 2002:a2e:a7d2:: with SMTP id x18mr6110061ljp.335.1619853273465;
        Sat, 01 May 2021 00:14:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:5c07:: with SMTP id q7ls2375304ljb.11.gmail; Sat, 01 May
 2021 00:14:32 -0700 (PDT)
X-Received: by 2002:a2e:9cc4:: with SMTP id g4mr6293399ljj.34.1619853272359;
        Sat, 01 May 2021 00:14:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619853272; cv=none;
        d=google.com; s=arc-20160816;
        b=JFMsyrYyHZgE6+WK9jm2Ayz5eCNqXMMq+QWOTqtlG2rhfx7cRoC0+wxCfjsDox17MY
         yHxSBM3SQpbV3cutAouWikj7iqYPqkwiSBcAgOHakumAKFrF5i88C5wq0ZxD3CyyR6am
         /QNoKrqWaDRremCvxoFrCMY3pAUlm/egGjVJWUDR5Gdl9DVJbc21RC1hMZrtTubaCXAc
         mt+uCsg3voSnQkf1RkYycugeQ6cq9khGlT8kxFspzozJDNwWZDTsEO3qFjmoJtxwygal
         a8tIyYzrerNqhs96rP1xZiMKECYqzkgi4cTXukCPSuCZVOw6bTt5A2YyZ8UVnY3T6iEG
         a3fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=fWAq0tZ8WioFrGxPj2Ccgc54CAYBY7NDfTrnXu9rTKE=;
        b=Rm0rHAyWW6PemfZTlz438ySD+UXIJoH7YyWEZpOBJ41IRpmhhIm3ZhZDpEOdZWLEiL
         /8O0o8aKWGM0VCpkWFwxkf3lqGEklbRAmUgiqXWPV4gult4EfBDDuWEBYCnguiEZM9uo
         uLSHxr/rQDV2B40NEiRmVYhtZsNfYn7CQC3p6B3k5Hc3t07SjywOyM8/AvQ+GC2aY5AC
         OKH2vei+6nbRUUpEhZPDBDYSbwlYgP4Slh1QTCnNA5oStEJEwjedUPNSL7A9tYTvdR3q
         mq0ASi4JflkkmwPuj/FLICFiKVmPBVsMle3Ev7lqnCUKp747m4fJWprxO1N6qNHTgp0/
         Alaw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=SGZf5ZIC;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id i11si409228lfj.6.2021.05.01.00.14.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 00:14:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.53]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N45xz-1lTyI20PZ3-01021M; Sat, 01
 May 2021 09:14:31 +0200
Subject: Re: how to run linux with root in none root cell ?
To: along li <v6543210@gmail.com>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <254a573f-0b4a-4c6e-a5d5-19d0734cf6ebn@googlegroups.com>
 <20a0834c-e41a-855c-71b3-2fea4ff89d14@siemens.com>
 <72da73c0-f3ae-41da-af32-d81c26a5b884n@googlegroups.com>
 <0a541a67-4abc-cce6-f677-7b4a1b86b99e@siemens.com>
 <f61a2abb-93fa-45cd-9c56-d967dd3a0247n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <0ed29e65-1ac6-a491-df2d-165c844e7226@web.de>
Date: Sat, 1 May 2021 09:14:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <f61a2abb-93fa-45cd-9c56-d967dd3a0247n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2j7q7pYOY0EqRSt7NC7+HvtZXA+XELd/R9RcwuTfZVQAXl3dFqL
 fX3ViVFpLACbqrVvyX9iJUcmY5GpUQl0DKgvfQQ7/BHyzQqb5wrUVcvmxbBbG1rcZiGxwkj
 KIKyueAn/1IDoWPizfQEZtv2Xo7L11S7VXIrUMZecDHCLFwaOBPgGo6fAqn50U1+yWCr9Fn
 tQyOWP1IkyW3RkIXk22oQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:IohiCbJYYks=:RrVfmQ+3y6PgeGIWUowEix
 WHMx2sRLOOBFopR+y+zodfrEkViGEwaAzfg0EABuM1JvuPDNaxSrUDly2/7wgsDMeKWFUgVlf
 Vz9EgY3pFISkGVj8aonRjM6XWQv6qIVKHBKSR4lTgDiRUpMjbRzp+EMVNWMjyx+UWLyWJIvsh
 qMWvs88ghKYFdWgkbduIa+SY3cDQP6M37Xx8btpF+Xq22a5cEHEmVYOwZ5URcEcCcaYB0/p8o
 DyrVFUKo3rv4q2lY1fvD9J3JzqlYWf4tsTTFUnMD4rleiWJ81hHdy88F7tytRDGHnrAJAntda
 F8E3ymSkTU1yLH0QhdwKADV/ED5n+iXgN4YBnr/2lHHCSA8mcYOOiYL2OCdwKfg9oUJlWoh/x
 kXvEMW2RsL3VczFC1oCzedptufk8VZfJmIBA0zKWplKJJEgANKDr6w23iSzq95jJwL3kG3rQM
 bZ9bW6TANQGOSmL30Z8lSUrSaMgR93McdTtNw0UsF3bwsPbof8/QOXsmiAZdpECHmW2NPCqZl
 ZSYVw6Besx/6dc1KmomJlutTGdSGBXWHySQrLX5/ub/iQ5K5MluOAePIjRsncGyftlqWdK3AI
 Vsz9YixZLoOXkMDqrb7s0EbS5RJUVHASdvZWYgMk7Hl4C25NpIMwXZ4RGD+6hI/zY3IV1gDDF
 hI9VEuDL7SAIJjXAqpShE3g3SC0BcnHchcmi9EBXZJT4f6pvpYJOK/dyGmIqaeHzrbTBYC/G5
 bLYR6kkFhT5lKL/winkgMSp9PjYjGiJqjiYC5aCFnDe2ufktiI54rHdAKLmwzlVsKDQIYG0Vu
 qj6ELYD6y/A4KZhW4YUBw2Z8pj0fE8I9smExIvoIBsLi/rTd9+2kOmBT5RXqjrYYgP80dB79b
 RQ1gpP3OQZxLJ+/R3LonSFMXgHYm4VRR52cWCNTRfO0ALb3BlCxqe2ipp2W1D4PtEMx/tf4nS
 1DZ64pmmiaITMjEgdAy2gJJyjPoHtt5AFl3xeKHKyX+Z067uRKb2FR8qwlXNjT3T2XUFEZPkv
 n7y7HP/C/8AQbO6IjeoiGVJjNZHuH99KUmM7R4g6K/L3xUEgOapfNidlKMUVJjRvSCPTwdOnu
 o8srM/wlVkcFtamrvT8j39Sf/Good/deg4TnrJ8qem28gFx1rp5AXKZtDmDx7YAUWIKrre/Zs
 Bsgzxd8O/vezshb+ONo4Jc6Ift+v80iRyJD9JS4+TLi4M81ekLDIUWpx92oIeDhWcn7fs=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=SGZf5ZIC;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=web.de
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

On 30.04.21 05:16, along li wrote:
> after I
> learned=C2=A0=C2=A0https://github.com/siemens/jailhouse/blob/master/Docum=
entation/inter-cell-communication.md
> I can' find=C2=A0 =C2=A0virtio-ivshmem-console and=C2=A0 =C2=A0virtio-ivs=
hmem-block ...
> where is these two program
>

Here:
http://git.kiszka.org/?p=3Dlinux.git;a=3Dtree;f=3Dtools/virtio;h=3Def6d96e3=
d6493aee0da932125cfa4e60aec63170;hb=3Drefs/heads/queues/jailhouse
(i.e. in the queues/jailhouse branch under tools/virtio)

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/0ed29e65-1ac6-a491-df2d-165c844e7226%40web.de.
