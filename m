Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBFGUU7TAKGQEJMMO7BA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 427D310CE1
	for <lists+jailhouse-dev@lfdr.de>; Wed,  1 May 2019 20:48:53 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id 18sf18059wmi.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 01 May 2019 11:48:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1556736533; cv=pass;
        d=google.com; s=arc-20160816;
        b=MUajLvBZJ5nVDMfYW5NsJyP2anQYWatIZfos6uOkmLTUos1gyQHmGGZpl/clWyGfnA
         A0Sh5A0NOHI0jeCh0s95M90Ay3SQfwXCO0aR/9/p/klVWK6f+BUvHM5LL6dZfVGCoF7/
         EsYWK9UpI5TGSA9BalwUmHJM4K6WHzUtghiSZBaetNRJMqlLRJP48VksssilTiHa0F8P
         l+QjrNA65JW4V9kotzal8BCZZpWl7Dt2dN0AG9a5wQAU9Z6Io0775ep2ndtemgNUpGZb
         wBZXnm8FtsJ40JL1cVeDdYTMvGWgbH8aznVHFyBH3qJFRIniI2VWpz47/EakXWtDZy9j
         dp3A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=7wBiSicZWhxDzaQFuBdUBAxtrZkKdQ5oMuHhWj5Mz7I=;
        b=gkiTAWqXqs2WFlHyaadmsqUjGO5OQaImlSVU+Zi1ZS6Yw57ZdZyi6YwvaePqNd8N2U
         9NICub+Yq3jQP2+KX9J8SnDdYhe97wHA9AlsEf/frC/huOY8U11W05SF/wQVn0zz/SKp
         e7gbolyt8YyuvuQxK9g0JJDIFONHxpFxYZAh52E3b67xwAyniN6tqTd+t5oYZqGydguf
         HmbG1XLfP3W8MZi7RhmLlju0DptYj3CMOXR/ZsJNi9tC3Bx9u/XAW04adfo0zMLCGTOs
         7qTMjN747emwC/OrAzS0gJbh4Op3IXWL4OHqn2l7A0AlCcTyN3kWdzVONikKAipb76rU
         qXKQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=e9Ujh740;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7wBiSicZWhxDzaQFuBdUBAxtrZkKdQ5oMuHhWj5Mz7I=;
        b=P2KG/pbJGcw82soPWM6/1Kk8e34BsKudSnqBra9F3Yy5pYbtb6VPB4vb0Z86/JzKsy
         41g1nBvFEbyS50l6DTwkOyu93HJc7/BRu664NWTbpyGesWkZT9kaeqxVw99Vd/na2mLP
         5/7miXe1l9wngvXM+RKoP0etmo9tmaQFLfxtrJzM2mlFJOShbRMrlUYLdDdatu7SEojl
         EsG+zD1gStiL6iuYp1zKbtG5SRVQVmq4P2LyjFhYo0+2QIW3TgYrkqWde0QqEXsA/Wqy
         sZHymLadi3wtiNVCttvoFkZcGKt2HwvaFzjETMmhDn44O0EYK/67ZAGLCt+6Tr+N+fyb
         7Ekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7wBiSicZWhxDzaQFuBdUBAxtrZkKdQ5oMuHhWj5Mz7I=;
        b=kjPsKlR2KboEOU0Ky+/H3et1thYUiKbhH+a16T4/SpfXstviYfITF5Jst5xd3aWARn
         eUAUHB0Gz4Jo/pdaqnNND9pml5el6h3OG6XiCmrPgaRdKhvhcCfWCy5Fzt6eBR1vZTmz
         jR60WdpHqJplxlvA7t0phbLEMkrFeBQxFWN/zulK1r1CxtY1hYM3u1tpnVX7llx/zEXk
         0hqm2dh8umptsdLUXQJkJALkSAmhf1Vq1A3/Q9nRf/S+oA1ghbNa3BPurIOszJvCIEfJ
         LcjgYpd+qpkXxgSagNiZxcgJgTwQ4iQHd/dFfN7wFN7OngklAXqdTafJkaqVqq7LbsLI
         iWlA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUIT2KxXeSGSNzkpvmzmEvvs9SMhJml/oyD/NSlrxrdl75UGZ5E
	D0lHj5zP1Yzc/6kWQ9dPyRQ=
X-Google-Smtp-Source: APXvYqxuOXLIoZbr701CZelN06IY0UbrmCtBDsqf7IY9xU5jrKDcO1HcEc4LoajwnNmoIQPxm8x3+A==
X-Received: by 2002:a5d:4cd1:: with SMTP id c17mr14953639wrt.231.1556736532968;
        Wed, 01 May 2019 11:48:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:9e95:: with SMTP id h143ls1901410wme.1.gmail; Wed, 01
 May 2019 11:48:52 -0700 (PDT)
X-Received: by 2002:a7b:c054:: with SMTP id u20mr8015480wmc.100.1556736532417;
        Wed, 01 May 2019 11:48:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556736532; cv=none;
        d=google.com; s=arc-20160816;
        b=OJerI0zkAAaj6Nxbv8JdcjyZwTzppVPluT4xD+WvwbPPdkFUGLtMPfE6wn7BtpTjMI
         Nx6EGkm/8FEzastMb5Qpz4k5rNyokQv3XkfmL1qlM2aUYj0SEacmfP5dKbL7i/g1am+s
         Ug1WGuOORfns5sFVPctKJ7ZByOLV95iQosh/W496FNfV0eIXhXIFf/L0/5vZLsBjcdiP
         pmKYeP9sFCna5LJz1Faok4aAU79pcNrzmPTRrvZdxrk6DCINj1jBcJcqUDhl5pfda8Eh
         oJx/U1scSfO8+kVCziAx+fAwY8oQ4XclcMXmRboxN4nPIqVIhYGujWtYeisER9iyel0g
         5rEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=k/eDxGSIrvrsZZnC1EW/a/NaSHapwgy9bm9KkrHwm70=;
        b=hlRZ36j3iI56+qVy1izLF+7pT5esfHae65ulbmoXr70Ny8J8DD5Y4ZJjz8BxuNGHK4
         wWKhuy/l2eKA+sFKa4rXL/FhF9n3F7pvCdAcqTKey2DGoRfLpG82FCgKizBoAMdXq8o8
         eaN8cOmzmyE/csfFDmflg9uREFcfP8Sly+lRV75dygH4poSzQyzmIk1AvOflHcAMRScV
         EDNdrDUeI81Twk/3tNsS9ZUi57iKif5VlEbk8PkO965ppVqUYDEmhli7M8+4wSlaC0KI
         fzZquuhr5kEzgw7S2FW9zjxD+yLii3MZn29ZtaGqoHbe/p1LXr+6GiS+FwcYWxZo+sYr
         wldg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=e9Ujh740;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id t1si272894wmh.0.2019.05.01.11.48.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 May 2019 11:48:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.159] ([95.157.57.47]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Lm9T7-1gmIYE406j-00ZcEc; Wed, 01
 May 2019 20:48:52 +0200
Subject: Re: Building on Orange Pi
To: =?UTF-8?Q?Arvid_Ros=c3=a9n?= <arvid@softube.com>,
 "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <F1D21E89-5762-4890-A51F-5BFC0F0B4E0A@softube.com>
 <75218ca9-fd8f-6afd-8972-0852c8121060@siemens.com>
 <225DD87D-67CA-4969-A334-B1B27FB05B9E@softube.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <36943512-5495-d84b-888f-e3752adb4a4e@web.de>
Date: Wed, 1 May 2019 20:48:51 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <225DD87D-67CA-4969-A334-B1B27FB05B9E@softube.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CDa7HaI5uIWIvLGSb/ebZX5QI6Nx2nlUQHTgHsCBHcxJVOTWoRR
 3HJWHDWhKEmNGt0rdv6P99oCRRRyAbVeAV2UfIMuRDYAhrKOjjPbsIgznvTNSpESsloQwpJ
 ZqjmzQpwd3Lw2jVKsoGatZNcoSOi2vnBxHJ9FrBjcQoUXXydXdpQqIflkZYgeAN/LSgl7mg
 fQaqRuDAIEbjwgyYwUEfw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:oJxnZYSb8zc=:bUvl5jLrlYtR38H1J7asgU
 HmbTl+MEkdA8LC0vIyaQDbTJJ80KMb7YejTE6u+qUo+S1jNrHpg7n0KSxOwjqnON5OIjs7qJD
 LbY+66rxgTjQCKwmTBECww+S7+k/5DrEq0Bct8hTcynAiwSkmqCK5lw1unMWZOHYTHJbpOZ1s
 H13S4pKfSYUBhzav/nIjy7Pj0WJYfYHllFA+4/zUasF73cYHayo3PYW5Y1wmAz9jGbSLz0Iuq
 sB+vqoe1I1sO6Uk9Y4lkBVJelOuEM8kFZYoFVKYyrXwYjyzFZV/iU7rNus3R47eVHAFEAvKKK
 Mt4coBTN/0OGNk3+DKdzsD2675ujlICAnEmiQuIBokVdlaUh8iy00pdJpNDotX+2bn7OWLM/F
 noigBbMbD9cAVABKnC67r1U6xuqFaYJteyK+Ib2L7bHoYgYNOwNbUKTVBKC1eNBawPWm0IVV8
 nmp2xdGC25Y3Xn5Q/m/0xdTJN8i+Lj4f8y1orprUDjCdxIgBvL8p4wOrXQC/oL2vTxp1RO0/i
 16klK8O2QCAnL2mnzGJT0nREip/H2FAn0lhUn44QO00bC1BxCbqt0ZDTa++vWebG6SgCowCeh
 kpiwGevx2z3cFSiHDu3ffgvBPpt7dIzlerZ7MJtcOwylfqU9cVIHx8ZafhAuMJFPP64izlrFk
 JpQMxDwOq4Or0IE9WCf1THvpuu2RlKUXZXkdtb6Kbd0+JXIbZaG1ZZHfiJxAlnfYQ8CTmaoIn
 S67IV2nEteCkKmcV4BeZU7uwh1kpmtyvyoOEnEJdYq6W0tb/TVnVM7mfc6C2jUym7Qx8Yu+p1
 5wSWgmDfOenyZerprT4NjgShQm7D0tL+GcJ0Xkxfy782I77zDmH17oolQI3JFoRjsuhWlbOcs
 ieudwkC8SfybxhMGSJoLr1263tCF8z+t5XlNXR9KIUFWpIuYI4qRWMu1F+ZUYlsZgnkc6cOBB
 kEq6CwRYrqw==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=e9Ujh740;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 30.04.19 21:56, Arvid Ros=C3=A9n wrote:
> Hi Jan,
>
> Thanks! Sorry for top posting and also being unclear. I can pull the sour=
ces from the repo, and download kernel sources for the running kernel. Howe=
ver, when I try to build it, just by typing "make", I get a build error rel=
ated to the syntax used in .S files and also something that I think is rela=
ted to tumb2 instructions. I presumed that I either needed some special too=
lchain, or some custom configuration in the jailhouse tree or maybe some pa=
tch or something. Or is this supposed to work out of the box?

Please describe in more details what all you installed in the target. Also
provide a console dump from what you called and what errors you got.

Yes, plain "main" will work if the kernel is found by Jailhouse.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
