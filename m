Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB47C3L4AKGQEKZ54JVY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x338.google.com (mail-wm1-x338.google.com [IPv6:2a00:1450:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2A3227B6A
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Jul 2020 11:12:20 +0200 (CEST)
Received: by mail-wm1-x338.google.com with SMTP id g138sf763451wme.7
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Jul 2020 02:12:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595322739; cv=pass;
        d=google.com; s=arc-20160816;
        b=ISqH8s37+V2G+4XfyR0Qox+gocCgVD/J6mkA5WinYLYK99e5LZcxJO68Qzcgj3ADcC
         kO+luC3B7amBE+++N0VHi3v2GOYIrQuVVg60r1ewJZGC9BnU6DNPHl5+LX05u1HGIcAl
         QAbFGWrrolCpfSjUKpXUTB1oOfxQSy64/qZOOs1kLk3fUVuFX8NM+GSttrkQojeUGQ8k
         zaL9Ate8cx3LE7vrsMDorTGF02+1hq6I8NK6+YNt2Suf6tLRkwz+t0ttWTJc3i3WdiI/
         HeFC9/HDwQabOVBxru+iiRdR2hJ7hMlh/QUi+r2rri7DKA0WJK6iWUH0ItFfFpubp0aS
         Jx6g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=M+rIFCUZchzxHDg11+i+m0t+ca0PoG/a1OkQnwIcASE=;
        b=IymWSFayvZumlidwEHDu6wz0TO7sPBxZC22RncOy7Bt7qrytms4maHzKkNrEx/oQH8
         guiFm6QkXuRv7ibg0As0ADyi62A23Q6obdviFy/pER2mlTKWN0CaLpj9RqYhlOvuh9Yc
         SdEy0pIqqENjN8RTR+9DbVI/6fQ27MCGP+OAbmiJDFIh2yk2ksXHcJyQx79cs+Ngjdap
         7DS13N7JiVmnHLgSi1oMyOZX75LljOJNDw265aVMyYCsPjjXQ5b2UP7pFNTi93p3Jfeb
         0U8CuthgBa/zRLCqEpjCauceZ9BHU2gl+egp6wCZZrhY89LM7cAW/5pNqExAT1YljM4M
         y6Dw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=JwZm8HhH;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=M+rIFCUZchzxHDg11+i+m0t+ca0PoG/a1OkQnwIcASE=;
        b=bBYd+gK/AbmF0iPzmxGF7Xu9womYgxrX5m3u1XmXOxf1EC2AiDAP1NSWr98vlNgIIl
         uuNSwTF9JhshNs2HZawOVrKJHLc5F9AK8ZPeuoW8Z55vMLI9UOYSUpst4XrsCgaO2lb9
         q6myiPRRDOnd7tSW/EUSZd4puNnV+0gb5IhR0HCakbcttPfdCngd59jjxmQhwsiDslkN
         iIewjqb2zTgG7ijYXhQAbm0VosOm7XcemMiVNhl70g2LYGQ/aZnQJJUS0kItCz11VLCt
         YUjvGn81KFkZeg/kIcO4w3OXRwo0E/FXuiXk8Tc+P86jiPG86KOjXyX99VFeAQegbCcC
         FS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=M+rIFCUZchzxHDg11+i+m0t+ca0PoG/a1OkQnwIcASE=;
        b=ClArI4RfJGtxZLYiVBmPgdDizNRuBQtKIg2GElYPJeAsHJ7HiTSxqb6mpJ5yhyIM6k
         HUtyOlR3/z03Sih0ckuCeo80B9Dxy6W2W6Kg1moY5UCz3Axnf7xrUV9ParhWR1O1cEZn
         C94J7qs9LU4fhN/vWCXqc4CT3NY8YDZ8V5LrsFNFc9DhJstfT/IFB1n9aG0572yPH7aF
         kY7q5mt1dUmHvu29xGJV198i4wfysyNwvZX+ANw3yEFPby740KoWA8VQ70xTEH2G+WjI
         o6zYg6fO+is3et0mCOiLuMDiSME27TSEXTXMtsGp6dCcpAdTn1Yhl/UQtAFp5nFTSpoh
         vM3w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532KgfitQ/hLb0GsN7PrNnAxibdpWQJ3A1ebQFxbQrTY34YeFBXm
	twRpo1uH5I/uYj1VQmWngCU=
X-Google-Smtp-Source: ABdhPJzKLK5/BcMsMe0YPr1j6fT6ks2uKkhk7dmO7XkTzp39kFoDO1bnLOSlJLQEHg+qLjtzima3xw==
X-Received: by 2002:a1c:9a07:: with SMTP id c7mr3199848wme.147.1595322739840;
        Tue, 21 Jul 2020 02:12:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:9ece:: with SMTP id h197ls891369wme.1.canary-gmail; Tue,
 21 Jul 2020 02:12:19 -0700 (PDT)
X-Received: by 2002:a1c:6007:: with SMTP id u7mr2445158wmb.32.1595322739257;
        Tue, 21 Jul 2020 02:12:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595322739; cv=none;
        d=google.com; s=arc-20160816;
        b=WZiCB0igcckHzrCDpgnGbKomNJl/Kr6shuZsf4JOIB3W9XLw3Ne+rY4EXVql2ctREZ
         ViQESc5iS4E6L3NcE9csxFOouJPe8zJ/5c+DnPOyAbBjPp5VN/3SQl6ebxY3wTHbWUAf
         rEpNk/icqM/dZHs7KAMCXv3yHR7M4AgN8pXdYSSrL2pQk5t4LfeE3yb1BV6f0WKWSbvU
         V4KMKHBMsEXsGRUSc/M/+ve5oJw4IN9Z1XC9ONbxu8U3iDkl4pqqqx72wQ14BkejBuvK
         kd5VCI8kpOvgJED+jsbfk08JjSj50r9PWXBzLtH3JCqUjEkMvtNykWDrbbKj1+l+vDNJ
         seNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=FJi36cQQZTI8S0/Fek5Ak0OkUD8jzGkeBWotl6pWR8c=;
        b=JTau8L6o2oNtFW7VbUGnRQ8c/fdExfd9e9YmvtM9dDyK4w3Ys3ht9hWVrnd/BjkADF
         jEfizXRwIjHUqpopXfLh6ymjmBME4fO5gF85fgPQeOp/e73PEta7T0Hv8bQdqdHLDVrj
         LSiWy6q/V3bHhDGUL1a7qPK1OYgcRPlPNfcGVDiwKFWP9BhD2uJFGI9jbfbSjTvheGrm
         bmFrH3TGeERpZC1K6r3NTgGUxx7iIxMN2gilamp+w3k0h/mRPpsjZu+Sdh4lHrC/YulF
         fmkj2vVLi91JU16cOg/BP2qle7qtRemM+Pll1Z+jJ1dHNqQ/IxGa51fxkwrbRdZPGmoA
         5ABw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=JwZm8HhH;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id g14si94308wmh.3.2020.07.21.02.12.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 02:12:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [167.87.32.116] ([88.215.87.113]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MYNzx-1kK6Ff0oRV-00V5TM; Tue, 21
 Jul 2020 11:12:18 +0200
Subject: Re: Libvirt driver for Jailhouse- Test set up in jailhouse demo-image
To: Prakhar Bansal <prakharbansal0910@gmail.com>
Cc: jailhouse-dev@googlegroups.com
References: <CAD6ScS_uBX7NCU+VinzamffEFH_kfh4B-MfR8nxt7+5VuNpRUA@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <0d84ce9a-60dd-c81e-d879-a278c8602054@web.de>
Date: Tue, 21 Jul 2020 11:12:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAD6ScS_uBX7NCU+VinzamffEFH_kfh4B-MfR8nxt7+5VuNpRUA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iCUrSv7ShvgJS34+WheG5Js00mKx3CQOFj/3QFtA6MdbUDzm1zh
 0x7zsuHbh8SwVY1KzDp9kWaKDzPDOAMFNTsUdJ9kzLGfds4SatzVsS8u+wT+3A0oEN28GFz
 F5bCTmBHqmmYoGqu04HS95U+gPiRDmlFlX3E0X8rRRo4w8+IIqpO2DuRjnVGlxthMw45JGJ
 TC45RreElIV+mHglwNTdw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:72IRxwG7POU=:AqRjEyFFEAs8YZvPNZ6HFW
 AOpLn8UAZ/xFDyjOQYMgbrOIUpkEnC2an7rtv1OzkFEPrrn2xpaJ7JUBEfYoTIbkQmO8pSUuu
 StmQgdzXXx2bPvNqNVrnKE2WmLZDWTYKh6yYfVzmxnQhRWg0m186pJGGvDoEqgU/yhX2xzmmd
 VSxWA/6xlbUoMT7iBi+/W1xrRR3k0BWHE/6WUDoYeV0XEQi5kJMBi0pWyh4cvaKZP8N5vR6bK
 AOa3FVnlOO/fEOZlVUqVGFewUOV7u51lEU7vp7d3DrBuE8Jwx8MTfZHN5k4UyjNPohsSXAXS0
 T7JRrbsbUkZiDHHS4Lqs9jMdSDDK2xSmuhXkyq1kfG5fux1NWg4KjkwzfeouCc/6YsGeWITbr
 2xGPmUXXpPP5Zeij9r0QkK7vydfIjmBDjwbRZLhdlEfW4VSNT6Kd+YZ/93e0nzyVKzmxu6LNr
 doSzL/nyWi1jxbWyeHVslVxiLQzywTgTtvY95q8JR1T60mU2I6GOWstTWk+jYuz48Gv63bdp5
 LGWGi947vLFpXs8Q2cGin1pG+2i7i/QTRNgqA+HSO3Nh00GBVIaMlGXICziOHD6Hn9rOI/jeH
 LuTtAmQeIBR4Sr6VrFB5AsMJ3JxcKl0hDC+6pbJsvn+t9Lb3FG9zvWcGEk8t5GEASunZfUZI5
 T/C2ea0uZ/Gr7uH1CdF6J0DwNxmSAyoL7TB8kI+6mBb5/8If0HoDrv43nI3h5XmtZIXdabJQ1
 0ClzdROh7RidWnrM5L8XOkV9P/0QrGYGK7ErF+bZG7Ej8JGT77mmIu8eW0hLFZNRwwqP5v/cv
 jqFEd8ydkSOUnfFPW9ZBPgUT9Os83GNXXxbiZcwD+4PIwPspavl7qTTXbehfhwAfSDfBKI22M
 OZiUF6G+TrU9P2J9EoVRorRhqWqgDYmigRyQLksT82oskVReYTAh/JOU+4pgsKLODcAbq6XG/
 BU8E7yNcm3Ap6PZF2Q7hZ28rEUhX/uV3vlB653Awk6YAUU7mGN2eeMbWLCflTnJAg7cx2IfyH
 fb4mt6Od+Uit13HOyPHXsmO3yKYrAmJH6jwHLyqVInuFPmBPuCDOioMaifTOYUR8Js/zJlG7m
 VURMZButhAo4BTAcN87hNNqdo88QgsLJaKWIQiyI2gkHXZGc7peIXikNk8wkyZuoeJEvYAnJS
 3r0nmvPl3Feob/1rWP2YLtEWeM24MJlkT0r96DWjNidPp/bzEWaZShkcHmlv56U4jk2ZpY7wR
 Lkg8Mm1nhlmVkBuWG
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=JwZm8HhH;       spf=pass
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

On 21.07.20 10:14, Prakhar Bansal wrote:
> Hi Jan,
>
> I am not able to set up the test environment by mounting host folders
> into the jailhouse demo image- QEMU/KVM Intel-x86 virtual target, as you
> suggested last week. Since this demo-image is created directly from
> QEMU-system and not by using Libvirt, I can't manage it through
> virsh/virt-manager.
> Also, the space in demo-image is not enough to build Libvirt inside it.
> Please help with the setting up the test environment=C2=A0for testing the
> driver in the demo-image.

Try

start-qemu.sh x86 \
   -fsdev local,path=3D/some/host/path/,security_model=3Dnone,id=3Dvfs \
   -device virtio-9p-pci,addr=3D1f.7,mount_tag=3Dhost,fsdev=3Dvfs

and mount the host inside the guest like this

mount -t 9p -o trans=3Dvirtio host /mnt

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/0d84ce9a-60dd-c81e-d879-a278c8602054%40web.de.
