Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBRH4VLTAKGQEWKP3NUI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F32116BF
	for <lists+jailhouse-dev@lfdr.de>; Thu,  2 May 2019 11:54:13 +0200 (CEST)
Received: by mail-wr1-x43d.google.com with SMTP id c14sf1943885wrv.5
        for <lists+jailhouse-dev@lfdr.de>; Thu, 02 May 2019 02:54:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1556790853; cv=pass;
        d=google.com; s=arc-20160816;
        b=Wgcr/U5oO92DnMtEhiGz+HkJqUIquAUYNk/Lo2uCHdSQX9qlRqwSFypNONJNeq2SEi
         Pjp/W7KGsbk9eu95tnwEsozggaiwMiMbZ2GCVkULnOMSRy3BG1sIDx7f10QrrFuC6AEg
         jesIYugAtNsOyiakl6pdrvBoiQaA3BDbXGceDVdQufY/hzzhazdQnSexQ/bQZZ5rzmSk
         Jw8ILdsb6zFBq4TPny2ya1Kcfn/U3QrwTWYgfrUMadIMzg3xarBiNWKTEYmnVXHR9HGG
         4W4jTAI6lsZdFI643ZABYk5IxIaXeJXeiYDs1KPKc70jcKqOBKjd1Fb+Tvhsogv30/vi
         PGwA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=T2NIbEzTgEiw9bKsBHu8GlYsbAG9HYuqd2LGHWTKHDQ=;
        b=Yw8Kaz4Bxv0vNYWe8pcDZP86Djd8XNqHXfhZ6pDmxt+j2jVHBy9qy3qibpMGdC6TiE
         QdMA5U4vVAyXLo+eUEn7JIa0vIRU2Ojc08+gWh6X6ErIQUB3NhQZGM8a75mShXVC9wfw
         dI6Q04FF81qQgG4wivHUzXiJ/hPZaEsS4wJa+Yx+EVnUBJ9tUhu8rxb3txb5iADMr3Ry
         MeqwBrWJQ72OU0DozrN+CrKF6HXa3tLg+1Vg0LMTMn7hj04qTqe+uOyK0gWCof9IrTSC
         QcJ0T2tcJuQXejmHvBmhHrVX5mzFFRBCbQdXqB1iutYen2EaUnfqj28/JCP1tdpPILCG
         UJDg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=VqqwG1Hl;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=T2NIbEzTgEiw9bKsBHu8GlYsbAG9HYuqd2LGHWTKHDQ=;
        b=KyrJhd0ipnev5Cg07/4yQs4Yxwqjl3G5wq+rxVSP5be6cWnMzO47znTEcTgXTW7uV+
         sv//X42w4Z8MVZTEIRgo2ZiK4OqYoMLVXhDT7SHxJygHSEd280aLIY8+/tpznSg6ahp8
         0iE0psDCLOrvT2Nu0O4zKWMEfHQo2yytFbS7Pii2vphSDT7moffqv1rCyFC/kWb7V9oE
         9XU4L07EujMv1LP+ZCv+RtS/DGqiIpcrsVn6PoN+4hlb/5lAr8zW1kV0StsGr/cuB+4H
         WNznQxZFgcB8pzPmojWyf/H6YK2mEDiIuBmTwitzOeq6RfviMvEpxNvKQveLUrzlQS17
         jWIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=T2NIbEzTgEiw9bKsBHu8GlYsbAG9HYuqd2LGHWTKHDQ=;
        b=RxcebVwo7dbGFB3lgPiYWxj05ApYkNRV+NKruvPkXyQnZfKBKQMMFOKKX+NVwpXoT6
         Q848lN1A0sV3BZYL2Yx+b0+qqnhBjUB78dgNXRy/U9QxMFxnhSbu3ZOEBM9SOlREjC7g
         rcj4Wv4ODI3wNhDaOqp1sjUi/KKejmGbaSgu3P0Npoa/xuX5muQwqsezhusJGWkomwo8
         GcC2jyI/hco66HyvD/vyKNrwZ8vaFTQ7YSqkkcRE0U6pUgJmyj8dvKzbbgXAITdY5wdN
         ISrQvjdrr7Gecl8I5NCB64taYauE5PaHFlwz6e3TQIk62xXyQMro6iXHvAcZqsVryW9+
         phzQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXaMAUOlfyucO5HmhVEFZEjfoVo4EfTF8GThlP/JgZv575h2keO
	9ILXuVUvirinSr6AzSgc8ec=
X-Google-Smtp-Source: APXvYqwuI/h9+xvcKnXs2Bno4rI1mhPYvfG7qQCXXEiyOl5WGOdfPPw/2VqugwQPqcIdk13asa1rdg==
X-Received: by 2002:adf:b35e:: with SMTP id k30mr2104468wrd.13.1556790853199;
        Thu, 02 May 2019 02:54:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6a8a:: with SMTP id s10ls386359wru.12.gmail; Thu, 02 May
 2019 02:54:12 -0700 (PDT)
X-Received: by 2002:a05:6000:1242:: with SMTP id j2mr2185290wrx.274.1556790852596;
        Thu, 02 May 2019 02:54:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556790852; cv=none;
        d=google.com; s=arc-20160816;
        b=dccJosVs0oB5ZPbAyJWJKHd24pfBrEIqVf9u5Xt6UFbhbdBGFQ8OpNRECowHfHQjFY
         kSiV+Ra1MC52csCbfG/9ysL0RhvvROt9TfdwCzoACYwS5mFXId15Gtsx4AUxZH482Hmq
         eOZr5cyaHf8qi1R1uNMbXyZpyqrYwrSfoGxUHPzG5sgLmit7YaWlfpuFRUwrYnEBGxYp
         Il7KgBmk0wC/BDWKa3BhW2L6OJ1HIx+iLWxyAGvJe9KvACrYYEzqYfkbXkjhBe64kpXs
         kes4HGPFB2PBFrXSF6/zKWmuYKysQUlfpRv3BeEtbygAEKPbIdgYrzcMtEIUBuStu29z
         mQZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=lYAZBTDsQed4sj3l6QjFmQQkJNbs38zOvvD2L9v1QvQ=;
        b=FqCZnkDKxt93tieOxSJ8bnnylrgARy+b0vfNFwX3xrESzKbSEh7b01/VzcDPq5iGur
         7sgbKh6zpEwkqatMrDSyR1sMxuAjVhsOA0JxCcRcGU+eh3qTh9jRND3+4VgJXzPnfJLG
         UGWQO/zHpAAMvc0GyrGTqipQyidsuoUYJ8lsfiHsnCTDQrOJFz83f9Bj5Rpox5efQvhJ
         a9JZ8BjU0sxZjsaJvBsgXn2rC9xlOSwjIfI4RKllsdkjEjg4dIw5KHsUYc+4no1rhbCr
         SblKFEDu//bwHd0EzV7R6SxYZ+cCCrdmUgQnxHe2LNXjyk8H4b87zfrgY29WTsOPrAIz
         EX6Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=VqqwG1Hl;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id z70si382252wmc.2.2019.05.02.02.54.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 May 2019 02:54:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.159] ([95.157.57.47]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LsQTc-1gbpIi0FB2-011yHK; Thu, 02
 May 2019 11:54:12 +0200
Subject: Re: Building on Orange Pi
To: =?UTF-8?Q?Arvid_Ros=c3=a9n?= <arvid@softube.com>,
 "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <F1D21E89-5762-4890-A51F-5BFC0F0B4E0A@softube.com>
 <75218ca9-fd8f-6afd-8972-0852c8121060@siemens.com>
 <225DD87D-67CA-4969-A334-B1B27FB05B9E@softube.com>
 <36943512-5495-d84b-888f-e3752adb4a4e@web.de>
 <6CB50872-A7FF-4688-BB7D-123AF52DD87B@softube.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <454361b4-b5fd-de0b-5d5f-d4c51f4b786b@web.de>
Date: Thu, 2 May 2019 11:54:11 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <6CB50872-A7FF-4688-BB7D-123AF52DD87B@softube.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DIyLEzjTk4zQYjJtMjEudJeFnfof7UlTyCccmqKrqU5wUXyMWc2
 fH8+T3KOmiSrprEh0n71lHuOjIXQsKegyrilnRhhY1NUrqUwpEYIAZUaQC6a5iacCJUn8cZ
 mK35kmb+KThGo4XTKjEKQ9sZDK7RirAG9aP+SQRhYpRknCqzRP7k+8Njrxmx6Fw/Ec6NinO
 4T9gC8/bKAQWZkIpraGvg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:j+LJOPW3O6E=:d4hnIRYxzICV2YlfnY+x0K
 pcm+qL150Vss9tTHft0nXUU8tG1atyQRAIE3bwvMDHyP0GMmD6LRpzbvjvCNuWAvePUrArotP
 BbLUI4yc6jzQqrCqe5irNR6E4upnYttgdgu9+mA8LJv//+Hjybcxjzsg2ENZcNNbcHYM7M7/2
 TxFck3P4Nvo2jPQEk7TwhBxK2K2KRg7pSwk7bNwe4gF523CDSx+rgimZP6UMSoe9GV+GlZtVk
 wQnQH9zSx/Q61q1R6AxeunQttlYSdsh6dKD/PJM2zY305ty6VRyzUx6tyoq/DL+8i3g+pdzX3
 s0x8BHAlkaq+2F76E3bbhqxH0xUq8DRY+JdLLVf667H/tqKhCBlY1Q6MHlLOfj6ScvaDked2l
 cIcLnhpsiGAYKTKjQ8+mtjVzgOhAyjkCeODvSK67kgzRhA+lCG9WIR3MciqUVZhvDYy/ruvJ5
 X6RGwacGO9U/Jjscq1T9Wg3eFe296ny+WJkV4VyrPuEtMB5eZqyd6qUoLeFbej2gfs8modtkC
 Y9aaL7B73izFyP6/ZDDy1gimsmZKxdNNpvd0kuKpVuoEczh59YycJm7ZkN/DWXPX0Umz6thQQ
 xSIZgwswGdmtmGE8fJEtPBDWzyLTHIgmT6WiANX6veXFBu3GULfX5HqNh4ypAFjFjdK4P+sR+
 XLOJHJp5hjU1YBzZhywsqqGwOK+01GJBVGUjsNml/EJYg90mo6HOT0td6mqXhkuqCSj3z6zmP
 Qx7/xoiGTt6qYTB9rxYpIePgjcXBt9/A0nzAqGIWIW9U8Is+sF949ddb4ZkrSSCDBN5LxHIXT
 mK73GRFwjyTb9aQBEDDkyifTm0uWU8JrHIFBl4YG1y9w6rDqkw9qnGhtdt/oKGtHpO3omJmtN
 5T9ARbhlzD1On1arQr7ClSsO5RnxC4yQqqCResyhnE7RVAEGV+0Vmy1qloB8h8QkulImZJJgL
 UP3YZu6l/AoXnIPC1z29zyy0AwNBXT74Fq0kvq5v5L0mAbjoQiT09oVGAyy1Ime9qDSR6SYTc
 MBpiTzpbFLNcngYCL6w5Auk=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=VqqwG1Hl;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
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

On 02.05.19 09:48, Arvid Ros=C3=A9n wrote:
> Hi again,
>
> See my commands and output below.
>
> =EF=BB=BFOn 2019-05-01, 20:48, "jailhouse-dev@googlegroups.com on behalf =
of Jan Kiszka" <jailhouse-dev@googlegroups.com on behalf of jan.kiszka@web.=
de> wrote:
>
>      > On 30.04.19 21:56, Arvid Ros=C3=A9n wrote:
>      >> Hi Jan,
>      >>
>      >> Thanks! Sorry for top posting and also being unclear. I can pull =
the sources from the repo, and download kernel sources for the running kern=
el. However, when I try to build it, just by typing "make", I get a build e=
rror related to the syntax used in .S files and also something that I think=
 is related to tumb2 instructions. I presumed that I either needed some spe=
cial toolchain, or some custom configuration in the jailhouse tree or maybe=
 some patch or something. Or is this supposed to work out of the box?
>
>      > Please describe in more details what all you installed in the targ=
et. Also
>      > provide a console dump from what you called and what errors you go=
t.
>
> I have installed kernel headers of the running kernel, gcc, build-essenti=
al and the packages listed in the control file.
> Then, I try to compile jailhouse and explicitly pointing to the installed=
 kernel headers. Is this correct btw? Or do I need to get the full kernel s=
ource and compile on my target machine?
>
> arvid@orangepizero:~/jailhouse$ make KDIR=3D/usr/src/linux-headers-4.19.2=
5-sunxi

Where did you get that kernel from?

>    UPD     /home/arvid/jailhouse/hypervisor/include/generated/config.mk
>    CC      /home/arvid/jailhouse/configs/arm/bananapi-gic-demo.o
>    OBJCOPY /home/arvid/jailhouse/configs/arm/bananapi-gic-demo.cell
>    CC      /home/arvid/jailhouse/configs/arm/bananapi-linux-demo.o
>    OBJCOPY /home/arvid/jailhouse/configs/arm/bananapi-linux-demo.cell
>    CC      /home/arvid/jailhouse/configs/arm/bananapi-uart-demo.o
>    OBJCOPY /home/arvid/jailhouse/configs/arm/bananapi-uart-demo.cell
>    CC      /home/arvid/jailhouse/configs/arm/bananapi.o
>    OBJCOPY /home/arvid/jailhouse/configs/arm/bananapi.cell
>    CC      /home/arvid/jailhouse/configs/arm/emtrion-rzg1e-linux-demo.o
>    OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1e-linux-demo.cel=
l
>    CC      /home/arvid/jailhouse/configs/arm/emtrion-rzg1e-uart-demo.o
>    OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1e-uart-demo.cell
>    CC      /home/arvid/jailhouse/configs/arm/emtrion-rzg1e.o
>    OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1e.cell
>    CC      /home/arvid/jailhouse/configs/arm/emtrion-rzg1h-linux-demo.o
>    OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1h-linux-demo.cel=
l
>    CC      /home/arvid/jailhouse/configs/arm/emtrion-rzg1h-uart-demo.o
>    OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1h-uart-demo.cell
>    CC      /home/arvid/jailhouse/configs/arm/emtrion-rzg1h.o
>    OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1h.cell
>    CC      /home/arvid/jailhouse/configs/arm/emtrion-rzg1m-linux-demo.o
>    OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1m-linux-demo.cel=
l
>    CC      /home/arvid/jailhouse/configs/arm/emtrion-rzg1m-uart-demo.o
>    OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1m-uart-demo.cell
>    CC      /home/arvid/jailhouse/configs/arm/emtrion-rzg1m.o
>    OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1m.cell
>    CC      /home/arvid/jailhouse/configs/arm/jetson-tk1-demo.o
>    OBJCOPY /home/arvid/jailhouse/configs/arm/jetson-tk1-demo.cell
>    CC      /home/arvid/jailhouse/configs/arm/jetson-tk1-linux-demo.o
>    OBJCOPY /home/arvid/jailhouse/configs/arm/jetson-tk1-linux-demo.cell
>    CC      /home/arvid/jailhouse/configs/arm/jetson-tk1.o
>    OBJCOPY /home/arvid/jailhouse/configs/arm/jetson-tk1.cell
>    CC      /home/arvid/jailhouse/configs/arm/orangepi0-gic-demo.o
>    OBJCOPY /home/arvid/jailhouse/configs/arm/orangepi0-gic-demo.cell
>    CC      /home/arvid/jailhouse/configs/arm/orangepi0-linux-demo.o
>    OBJCOPY /home/arvid/jailhouse/configs/arm/orangepi0-linux-demo.cell
>    CC      /home/arvid/jailhouse/configs/arm/orangepi0.o
>    OBJCOPY /home/arvid/jailhouse/configs/arm/orangepi0.cell
>    DTC     /home/arvid/jailhouse/configs/arm/dts/inmate-bananapi.dtb
>    DTC     /home/arvid/jailhouse/configs/arm/dts/inmate-emtrion-emconrzg1=
e.dtb
>    DTC     /home/arvid/jailhouse/configs/arm/dts/inmate-emtrion-emconrzg1=
h.dtb
>    DTC     /home/arvid/jailhouse/configs/arm/dts/inmate-emtrion-emconrzg1=
m.dtb
>    DTC     /home/arvid/jailhouse/configs/arm/dts/inmate-jetson-tk1.dtb
>    DTC     /home/arvid/jailhouse/configs/arm/dts/inmate-orangepi0.dtb
>    UPD     /home/arvid/jailhouse/hypervisor/include/generated/version.h
>    CC [M]  /home/arvid/jailhouse/driver/cell.o
>    CC [M]  /home/arvid/jailhouse/driver/main.o
>    CC [M]  /home/arvid/jailhouse/driver/sysfs.o
>    DTC     /home/arvid/jailhouse/driver/vpci_template.dtb
>    DTB     /home/arvid/jailhouse/driver/vpci_template.dtb.S
>    AS [M]  /home/arvid/jailhouse/driver/vpci_template.dtb.o
>    LD [M]  /home/arvid/jailhouse/driver/jailhouse.o
>    CC      /home/arvid/jailhouse/hypervisor/arch/arm/asm-defines.s
>    GEN     /home/arvid/jailhouse/hypervisor/arch/arm/include/generated/as=
m/asm-defines.h
>    CC      /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/contro=
l.o
>    CC      /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/dbg-wr=
ite.o
>    CC      /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/gic-v2=
.o
>    CC      /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/gic-v3=
.o
>    CC      /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/irqchi=
p.o
>    CC      /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/ivshme=
m.o
>    CC      /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/lib.o
>    CC      /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/mmu_ce=
ll.o
>    CC      /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/paging=
.o
>    CC      /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/pci.o
>    CC      /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/psci.o
>    CC      /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/setup.=
o
>    CC      /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/smccc.=
o
>    CC      /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/uart-h=
scif.o
>    CC      /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/uart-i=
mx.o
>    CC      /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/uart-m=
vebu.o
>    CC      /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/uart-p=
l011.o
>    CC      /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/uart-s=
cifa.o
>    CC      /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/uart-x=
uartps.o
>    AS      /home/arvid/jailhouse/hypervisor/arch/arm/caches.o
> /home/arvid/jailhouse/hypervisor/arch/arm/caches.S: Assembler messages:
> /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:22: Error: invalid reg=
ister list to push/pop instruction -- `push {r0-r10}'
> /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:26: Error: instruction=
 not supported in Thumb16 mode -- `ands r3,r0,#0x07000000'
> /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:30: Error: only lo reg=
s allowed with immediate -- `mov r9,#0'
> /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:33: Error: unshifted r=
egister required -- `add r2,r9,r9,lsr#1'
> /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:34: Error: source1 and=
 dest must be same register -- `lsr r1,r0,r2'
> /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:35: Error: unshifted r=
egister required -- `and r1,r1,#7'
> /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:43: Error: unshifted r=
egister required -- `and r2,r1,#7'
> /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:46: Error: instruction=
 not supported in Thumb16 mode -- `ands r4,r4,r1,lsr#3'
> /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:52: Error: instruction=
 not supported in Thumb16 mode -- `ands r7,r7,r1,lsr#13'
> /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:54: Error: unshifted r=
egister required -- `orr r10,r9,r8,lsl r5'
> /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:55: Error: unshifted r=
egister required -- `orr r10,r10,r7,lsl r2'
> /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:59: Error: instruction=
 not supported in Thumb16 mode -- `subs r7,r7,#1'
> /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:61: Error: instruction=
 not supported in Thumb16 mode -- `subs r8,r8,#1'
> /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:65: Error: lo register=
 required -- `add r9,r9,#2'
> /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:71: Error: invalid reg=
ister list to push/pop instruction -- `pop {r0-r10}'
> scripts/Makefile.build:403: recipe for target '/home/arvid/jailhouse/hype=
rvisor/arch/arm/caches.o' failed
> make[4]: *** [/home/arvid/jailhouse/hypervisor/arch/arm/caches.o] Error 1
> scripts/Makefile.build:544: recipe for target '/home/arvid/jailhouse/hype=
rvisor/arch/arm' failed
> make[3]: *** [/home/arvid/jailhouse/hypervisor/arch/arm] Error 2
> scripts/Makefile.build:544: recipe for target '/home/arvid/jailhouse/hype=
rvisor' failed
> make[2]: *** [/home/arvid/jailhouse/hypervisor] Error 2
> Makefile:1520: recipe for target '_module_/home/arvid/jailhouse' failed
> make[1]: *** [_module_/home/arvid/jailhouse] Error 2
> Makefile:40: recipe for target 'modules' failed
> make: *** [modules] Error 2
>
>
> This seems to be caused by AS using the wrong syntax or something. After =
some searching, I can fix it by adding the line:
> .syntax unified
> to the top of the file.
>
> However, I then run into the following problem:
>    UPD     /home/arvid/jailhouse/hypervisor/include/generated/version.h
>    CC [M]  /home/arvid/jailhouse/driver/main.o
>    LD [M]  /home/arvid/jailhouse/driver/jailhouse.o
>    AS      /home/arvid/jailhouse/hypervisor/arch/arm/caches.o
> /home/arvid/jailhouse/hypervisor/arch/arm/caches.S: Assembler messages:
> /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:55: Error: shift must =
be constant -- `orr r10,r9,r8,lsl r5'
> /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:56: Error: shift must =
be constant -- `orr r10,r10,r7,lsl r2'
>
> My guess is that this is caused by the fact that AS is trying to assemble=
 the file for arch=3Dthumb, but the source is written for arch=3Darm.
> I'm not good at this, so that might be totally wrong of course.
>

It is probably related to the kernel headers package used here, because the
whole thing works fine with our kernel. May still be a bug in the Jailhouse
build system in the end.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
