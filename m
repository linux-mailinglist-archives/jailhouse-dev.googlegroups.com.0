Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB34U2GBQMGQEOWV4WNA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D64235C780
	for <lists+jailhouse-dev@lfdr.de>; Mon, 12 Apr 2021 15:26:08 +0200 (CEST)
Received: by mail-lf1-x139.google.com with SMTP id d19sf1289510lfs.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 12 Apr 2021 06:26:08 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618233968; cv=pass;
        d=google.com; s=arc-20160816;
        b=bdyaP6HDf8fy1e/AOctumjmit5jI3HfAMdLvDSNjcGWocLWuVtg/ny39Gv3t056fbE
         mTDpA4+ErD+Qv/f5RdGlUISJc6SZNr5q7Pgfdoe4aVWoGmNjjlAL3yzNoFWMb//m9a++
         FDRuRHukTAwyifbaG0j6nfH4YUOHQhU7yVGMbNAwz42SMM7K5QsxECytCdaDaWGhzh/m
         sJOI2P982UCNx36EVvbl5DIgTpH2f5PoSC6lFSQLHsBAwor6ErQwQp9qcEJC7N7I0Gd1
         7C0qOZK5DAIZvI2brfbWPCwlDoLm9aiu7t5lTLeJ0dPtmiQdYMTyDy5hAYThbnRc/ZWq
         YDsQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=rbPkzoZjSO6GveQJEBcG3FvW6H5REm3ctB5/ZFZSVws=;
        b=BL6Yxwj8z5pjF57QZTs8njSe/pS59NeAanfEvh2gEehiOims9RFkYJ27hDUh9YTo7J
         ue8/EXf/Y/EVlF0EnuEGpqyQccT0RUYBK5UroWAzgz0SAZSwo3ETaougrMnmlucEY3Xf
         H+aKchzhiwYz3l9jnpFdqpn3qKyXw2loqDX5uSbGfAO8I6Gx+O5pLwzTdIBlccOPRTr7
         LTZ8c1MmtSjMm/mobQR8x1ZszCUyb3GwTvZxqZnr36qJsDsmQLm25r0/AKyNjIwB54l3
         lrWZUnb9F7vngbdZyhGOXkdbAZgHFdVSctbdeNK9VXPbVLWhwxwKN/63MhNMBOzn6ZZ2
         Hkjw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=WiZsy1CJ;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rbPkzoZjSO6GveQJEBcG3FvW6H5REm3ctB5/ZFZSVws=;
        b=SMb6wiaM7NXzFevR3gr5NWZhWcjbWtLrDsdTvt8CrUIVkPzcydK7gMDJtcQMvN4aWy
         yUAABHOuWrHM6QTPdudi8gTeFxSefu+6zB3ApstxMh+0V+MXPo7z4o0ctD46FjqQdg/D
         zjx4dqPhIe0Y9L/DcsW6eDJtOnfQUmUdcxUJ/tDt6AuNiSKjrrkVFRPol5s/ePmm2cS5
         9TAYq6la5KzLEz17SaH/E2TQwx7WD3F6cJa10XpxQ53QCOjsFta+pnCur6Suk9mXHIIR
         Y72BYwARf44egZGpaKQufpdC9BEkDLprJsozR6xUe/w4Cc5zvlefVfa2rk9rRe7gntFu
         /90w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rbPkzoZjSO6GveQJEBcG3FvW6H5REm3ctB5/ZFZSVws=;
        b=fc0O8uES1PRUt3+pf/RvSuOtnRw2+OSFIIbwjqRs/m3wybMsxe6yfvIPiTqFpptfcD
         Hae/fpRykAGJnOmy0BKzc2oYyKjUa8vA2xG/42/rWcjK5uiOohPDR+dPIy6vQT6JJzmP
         PKB3D93SHkC+u8yhyEDDqc9EjJWtoZH+KPGM+6BbfIZ3NbC2/gyGiIsse85/mpkmeKbr
         S3SWl4u2nPqOPR4YtJRR+l1RkgxQ2gv/m4jgWv8lR8Fd6JkJkqwvPmvmJZp43r5y3J6/
         hZ1yrd6oz6UnFho79xzfdL5MrxrZSa+2M+f/83GX3ivOnoknxeZkayb4UbSIZ0eD/5mf
         6SWw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533ZR40roSH7LW3BfEFQS3gCLp2crmyf0/kNjUABqLTjq9bFAt8i
	7aXq5vlNlMnmT9WAk5zv1q8=
X-Google-Smtp-Source: ABdhPJx9Cu2W7pcBBOH3TxvPkfTopje98GprYDn2+q3V75XRP1DftI/ET0fld14zRKOpO9fj5Zx2Tw==
X-Received: by 2002:a2e:9b0d:: with SMTP id u13mr11788702lji.4.1618233967886;
        Mon, 12 Apr 2021 06:26:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5081:: with SMTP id f1ls1233621lfm.2.gmail; Mon, 12 Apr
 2021 06:26:06 -0700 (PDT)
X-Received: by 2002:a19:ec12:: with SMTP id b18mr4726808lfa.33.1618233966845;
        Mon, 12 Apr 2021 06:26:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618233966; cv=none;
        d=google.com; s=arc-20160816;
        b=vYx8OtSHj1/QK3X9XfAibZq+4sowTSm9j2qprD/2DofATrlDiXNaF3SA1O0W3Bs/jo
         6C3kqJoq6ohmPt7SDa8+ctIyEWHn1E4MNrkNImCB9fstdiFC+WB6GSFarE87upe+yqLY
         mzylhZBZybzHPQ3WrC7FSS2qhNB1LI5Y3+nx7uVy0mi8O+5bK5TJ2fr8MgimFkoK8Qxl
         Lj/LYgFJRVlnDNQfVnUJGLgvX61+gCq4I3vEO082hTfBnioQQKIO/EWlr6LyhITjmFFc
         HnXBcEOqq5Kw9FC5a3A4126cNuTRpTmEwf8Ms7rB8HuAaINPO2dtJyKP7oVTOTASe7x9
         iTWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=UMCP8AWIx6dlVdTwgzkvJxSqkHbMZcrVtXHImUNZdEw=;
        b=FAKh4mSEGJmkEIgX7D9l/JwKWKdjy8oXPqIz5qY3yuMC7li7Q8vojGWIVHkSTxu1FT
         ANd5SmRPvqyHE1ZTdlR//HopQL9k9CxTUpl73JW+adlYPT2AdjjvMz/pE6dAA7GNNkpo
         D1qgULEmpqScQublav6QHAcoXsDsZImCMgSrWWog282ipzsCvxEBLSHXkSGWZDSpZbpt
         QV4cGXxUE/Pl4dedwmkgzE8IX7oFJ2rH+Vq1GZYj/eDnG8869MRYHjSenBWvnNjhPCBJ
         bl+71BoipV2jjtKUbzr/l90c7QMKKZ8fFIb5KnUVh8/zcOB6snpypMikLZTDLZyqhNXx
         +/+g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=WiZsy1CJ;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id f7si492447lfa.0.2021.04.12.06.26.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 06:26:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [167.87.46.221] ([88.215.87.53]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Ljrq1-1m7kMm1g3l-00btOU; Mon, 12
 Apr 2021 15:26:05 +0200
Subject: Re: run two linux inmates on raspberry 4b
To: Smith li <v6543210@gmail.com>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <ed7d5b78-da24-41bb-8d36-605086fb26ben@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <5293b37f-e62a-30a4-eb6c-633775c22337@web.de>
Date: Mon, 12 Apr 2021 15:26:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <ed7d5b78-da24-41bb-8d36-605086fb26ben@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:h9m4lxPEeAS7q19QuuyiSgi4g1/d4UIg7Dbm5BZ8UbeeoK4FHor
 xZO0HjReJ/kLyAz9jRESPz28sq+f8FSBQZT8dg1jT4wcqeYUu89ARFBd3DiAtSpmhLorFU9
 4/DwEH2LgYfDw8ToqRuo/IFGlY3JH1B5jTNKF+K0TPab/oEd0M+4YviWKPnaLncy7ooQqeP
 QM1Q9kWSSc3zYbJMheFWQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4zM/Z2yvbVY=:egUyu5OL2809KsOuVjIL0j
 yoyusHkaWDWe7iJJVitnQNhupHMDOWX9nfjXpve/zBp/3ifqvBZQM5ZKpGhF0HuqqwpwYI2mC
 xOWKrOxfAvYgUZfyaYrCpxkyqkUQ3xTA2cBhfrhYCNt6UdReL04se3+BUSvwoUM0Da9l77BoZ
 5r3pb3PgtzCiCO+qBqFnMzbROMOzv/3ALiQwF6H2EOtPrtTjtxTE9f/LyU61+hLo0tdFdEyQ5
 w23D+2RuJNOlf5r+scVj2idTVofRDdpj68p0oqvJTKlr5RoL9SwoqaioyGohn6LTdk5dKjkYN
 KCWLiqEjmv6jwErjJz0G1qZz3XDNgh64nUadWYRc3qnakwH3OgZ5ln2jnYB8T7j2cwCqaBy8l
 Usuzx6PqF6L9IcVzb51dBLl7lYSAEga//n62tjXSX2yRcLdUfuuNPV3LNy4iaOP/f17I/df7X
 9ckpYX5MsfUAQ3e8uNhcdnde3Xy/QOe+r+Klx8JkY9OcvU4qAKLUQxxOyQhmhRpVOJ9F5uGrX
 m90dEAksKCvnlYomayMfqxa5FLXQ2PU0GOc1bHENt0539mnKpDhUk7ru0tLcgs9ilqY5p7Nsk
 eEgRpGScuot1VAUXoYFeJU2k6PGdWblZn5Cm7xFAj+GoOOs3cBHtizkUnehhr4KA2h1R+ftr/
 xacZN0dYJfTNtHE+n968mUnJaNdmtD4q8tJBF/rYUiJZ8OS19TuFArqcFVG0OJN34Z7zJ7z/J
 ljGqmjxhgdJEc9KJKjJMQxZF4lY8lTUalS1S85tTbQZikqM2okSR+wam/Vvo1xJnRD2DowPdW
 bUHMsnq1mH6QkPQHB1nvC06qsYGqvoV+F1Wz9LGBDbW//YleWFJzFttC2UY5ZSITz3B0XBMSU
 TUp/s2Vu5xIPyf5koi/+5WcMiUGTQu0HuFVpIPvwjCX4m9NcKtrdlmDtzOmE+psJc2bUJo33N
 vP1lu7c9MbtsuG+jDk1Mm5qUBZ9MwkpXi0zyTD2O39cDSbzbwuLjeNefoJEMYmLtGAmT1BOuN
 2qxsYX2UYsqGPTi8VTlGiOr6gHuVCbAYm7nhQbGIlQ2zKvNjDqKwVXBe7Fz60GFPuDMr7ckCL
 n04SgkaC1lM6fVU8yUT7Oybp9gt9op+0wbfbM+tlxGGA2+di/IjaIFf5QBrz+9ztuSR8QbsnM
 HbH0fR09tFb7WvMVBOVvxG3SrTRYLvbZ5CA2mtRSNgjQIeYcTaFPGyXiwfvBtEFbwhLsE=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=WiZsy1CJ;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
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

On 09.04.21 10:46, Smith li wrote:
> These=C2=A0 file are my configurations to run two linux inmates on raspbe=
rry 4b.
> Hardware memory is 2G.
>
> How to use?
> put three files into configs/arm64 folder, make , .c will be compiled to
> .cell
> The OS and jailhouse I used is compiled from=C2=A0 jailhouse-image reposi=
tory.
>
> after run=C2=A0 "jailhouse enable=C2=A0rpi4-two-ivshmem-net-inmates.cell"=
=C2=A0 there
> will produce two=C2=A0 network device in root cell. one is set ip as
> 192.168.19.1 , the other should set by yourself to 192.168.20.1=C2=A0
>
> jailhouse cell linux rpi4-linux-demo1.cell \
> /boot/vmlinuz* \
> -d /etc/jailhouse/dts/inmate-rpi4.dtb \
> -i /usr/libexec/jailhouse/demos/rootfs.cpio \
> -c "console=3DttyS0,115200 ip=3D192.168.19.2"
>
> jailhouse cell linux rpi4-linux-demo2.cell \
> /boot/vmlinuz* \
> -d /etc/jailhouse/dts/inmate-rpi4.dtb \
> -i /usr/libexec/jailhouse/demos/rootfs.cpio \
> -c "console=3DttyS0,115200 ip=3D192.168.20.2"
>
> then the two inmate runs.
>
> I take some content
> from=C2=A0=C2=A0https://github.com/ekut-es/autojail/blob/master/configs/a=
rm64/rpi4-two-ivshmem-net-inmates.c
> But modified some content.
>
> Wish this will help someone need it.
>
> lake of doc make me headche.
>

We have not much written docs, yes, but executable one, including for
the RPi4:

https://github.com/siemens/jailhouse-images

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/5293b37f-e62a-30a4-eb6c-633775c22337%40web.de.
