Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWMQW77AKGQEGRDI25I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id 9731F2D0A91
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Dec 2020 07:14:50 +0100 (CET)
Received: by mail-lf1-x13a.google.com with SMTP id f16sf2297277lfk.7
        for <lists+jailhouse-dev@lfdr.de>; Sun, 06 Dec 2020 22:14:50 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1607321690; cv=pass;
        d=google.com; s=arc-20160816;
        b=w/df8YcRrARbNg0FN7oSr0XDXWzRfsBCNJX/YxFQf5DS183l0DlevHo5hY3NEuubvi
         ZK/TrgjCMYnhaGngk/4J2ZMU3FwSw2AwwjY/QaaaQah8hsVac3cZvozdeETKNu44Sbjj
         0YNtPaNfCeCu5ce8Jw1VQM8vBqDFnhDkV/Nh61VnDimSAEBu6OEhEP2jeJ/ogd9CTZ9E
         o8PmSHozdr4qMEZ2mbfQO4pxUov4ieuoNAHOw3/xktIaGrhPXKB7jPYHk/73tIPHR+HQ
         rJnTy98CxalWzeojZKAFwcT2DNi66afF+boG86kF58IPvPnEUXHmzAm5RIvb+TAdX61P
         aQTA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=lz01sBOyeUmLdhMLhRIzHgmPie3vsjxzsPa/y/I10vA=;
        b=pUCI827jgNfM+gKK4QfeWoSCMQvLjMJqBolb2gIb8G29J4e6rW/uSkBlUf1kI92Vfi
         JvzbAZpAJ3O1CKQcKTW6sZlW95srKfKBxKkx2Dg2yq2IijEZ6kCpqvVn62MMt/mc2NV+
         xIgRb57HjepNhpMubi/7u3+7QwRqjIJq2xsIQrCMZr3j6UYabMnS5yZEEPJPIR9unuZw
         1F7YwKq2uMUCp+apElXQaWaOeo26oKO2Dx6PZIgcqusdNv3dGN2++Wk28TvOABrixh13
         9c+0dIw5QZcu/ghbvodiIE2Em4u/Ji8PQcBkcMdkoJLETXVE/Qb9aWQ1M5XnfgL14G4V
         HyuQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lz01sBOyeUmLdhMLhRIzHgmPie3vsjxzsPa/y/I10vA=;
        b=ZP8nxbKU9nfPEYkXaI4e/ghikUtEeMl00kXRyEREUrRO1ax8cJGx4kHSkaLc090P9m
         L4maj8wE0n0UezNxH/KI5v7Gzg3O548id3O/bK4Os1NauwvB6qcDEW82qVbjtQxQxfbZ
         LBXyL/UyKEzUb7KKHFZrREYtjwhbQPFwQqsixHsl4n/DwRho/I78JQilwo+0ohjfJnKL
         wKJpHdFXfFXVVGd4YfrF/mMaZMkDVCt6HYvLOjUM8mL5Yh3/dSVedaJiUPnk1VuqGXEi
         XVBdGB4LpHpYJ27+2buCORcpwNfSQ5uGhwVAcXA2BTv1GAATJfWe+1ltLo9WiUfWf1Ph
         isTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lz01sBOyeUmLdhMLhRIzHgmPie3vsjxzsPa/y/I10vA=;
        b=M9Qi10Slhi5DTcFw+hi2JO8dbnQFq8Be7l0/l2l8ulI+oUJPtLL4gaCdFHsFhcmtE+
         1tbGlQvMZrDsi/qj1J+ZV8+R183PK9LNMOeOZzzhU9rdoGk/WY8vndhe83wW/OsYpUFN
         XEBf63AtxPhDlOtneWSPTxLIrZMnTNUH2jK3z+mNakMxTm3p2Nh3+icdw+0ahgrxgf7l
         GnYjaCZsAzLzAUofXRg58IUm9nmROoh5vEstI0zA84PEBIUlIo6RWuAxgyT8akXf9Ncd
         bQ7JQWOaxAZlAkfzJp1ILin3FnVDlcVBjyR1f4CWCLnY79GufeutY4fdX2/g5VYi0G2W
         DjlA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532f2F+FgfiEvBWKSf+gZcYsuA70lK31X1sU09O1nVUTY4cO6a0l
	XytA4DxqMRa8nD80Z6h4oRw=
X-Google-Smtp-Source: ABdhPJyPR1nC8kNtYihCZw/cGpAM6Ji4zVFlfJPNbK60O7k8j0K8WSEEM4XVFKOpjde7VxzvZ4SLvA==
X-Received: by 2002:a05:6512:6c3:: with SMTP id u3mr7918380lff.204.1607321690037;
        Sun, 06 Dec 2020 22:14:50 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:10d4:: with SMTP id k20ls885179lfg.3.gmail; Sun, 06
 Dec 2020 22:14:48 -0800 (PST)
X-Received: by 2002:a19:c6c2:: with SMTP id w185mr1169077lff.354.1607321688660;
        Sun, 06 Dec 2020 22:14:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607321688; cv=none;
        d=google.com; s=arc-20160816;
        b=oxmoqCAuT1EiMOPvLTBksafToBtwIr73dtNt9mldEz+pAO4qGNFGk7DAXab2ob8lKY
         Ky6eEVWE3TP+dtxQN+HIzYLQYze6vvBHT6iXVO/vqYhD2Md0f8sxN0yu+sMRfzFV3eJA
         3bA6JCplf8rZqcdgCjJwCt6hgdUlbVvIh8K/WzXIshggcsZupVp/Bn/2jZQjVfodw2G6
         MDmuJ8keQeiYfSSBGZ4yO5Amh8X8Oi9Xqr0B0XGG5SuHUMsYouM6DTCK1ZECmlMU4Aim
         icGEgyJDu2/mCBbuhC0OlOTF/os5wHimjoS2f9SBfqHb2p3jatWwDwGDu1cBfSL2o9pH
         04gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=fbyCOIueK2fGM+bizsK1njw39i9uaIUHxgGhunMsb6s=;
        b=de2rani1d4YDoAwEnMLZg6CigFs1VOj8OyVuNjNRFspVbxfflv1B96cNLGtcLYOzsZ
         OVDmMe7WgVa+lTKuIrpKRQjguyHiF1l6WG+g0Nq5N+VR1sYYSoytueshTKVIRmwA2jha
         v+eOLb+jC1Mdzq1ph0lsikaJwG0zOW8UWcnUjpHmOjhC7/L4KZ7L8vPofDWPek52Gb0R
         WDHztzZtVBhAAvh9/VLMMTHGHWJYKeK6kZGffwpxRnQl1rsdqEVDLscoADi/kB2G4e5Z
         d/R8tLmadxi6r/OgEL4zfTuLlfFi/MzhPEG1VXOCw8rrqmc77y0CCu4e5Wx6EHOIJrND
         REUg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id b27si224795ljf.8.2020.12.06.22.14.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Dec 2020 22:14:48 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 0B76EkNo018308
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Dec 2020 07:14:46 +0100
Received: from [167.87.36.107] ([167.87.36.107])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0B76EjI1022665;
	Mon, 7 Dec 2020 07:14:46 +0100
Subject: Re: Jailhouse on R-Pi4 with Debian rootfs
To: Chung-Fan Yang <sonic.tw.tp@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <f0e8ee0a-e874-428e-a97c-91524477c7e1n@googlegroups.com>
 <CADja47Ob29sD_YXYwnxiauGse4sd8MHqhBRq2hy+94JTW2dgyA@mail.gmail.com>
 <126f7b0c-2fa6-4329-bb95-bddead90c9f7n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <b6206c2f-ea42-a3ec-d95c-5e84931ece21@siemens.com>
Date: Mon, 7 Dec 2020 07:14:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <126f7b0c-2fa6-4329-bb95-bddead90c9f7n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 07.12.20 02:29, Chung-Fan Yang wrote:
> Thanks you for the suggestion of using an approved image.
> I will try it out.
>=20
> However, I really like to know the root cause and get the current Debian
> setup working.

[1] officially supports the RPi4 on buster (despite the pain that
brings, hope 5.10 improves the situation at bit). You should derive from
that, specifically the DT overlay-based memory reservation which was
fixed not so long ago.

For the kernel, I didn't do a rebase of your patch series yet. [2] is
the latest upstream based queue.

Jan

[1] https://github.com/siemens/jailhouse-images
[2]
http://git.kiszka.org/?p=3Dlinux.git;a=3Dshortlog;h=3Drefs/heads/queues/jai=
lhouse

>=20
> Yang
>=20
>=20
> 2020=E5=B9=B412=E6=9C=887=E6=97=A5=E6=9C=88=E6=9B=9C=E6=97=A5 5:01:26 UTC=
+9 jsmo...@linuxfoundation.org:
>=20
>     Check our GSoC project on Automotive Grade Linux:
>     https://git.automotivelinux.org/AGL/meta-agl-devel/tree/meta-agl-jail=
house
>     <https://git.automotivelinux.org/AGL/meta-agl-devel/tree/meta-agl-jai=
lhouse>
>=20
>     It can build for PI.
>=20
>     An it can serve as inspiration for the values needed.
>=20
> =C2=A0
>=20
>=20
>     js
>=20
>     Chung-Fan Yang <sonic...@gmail.com> schrieb am So., 6. Dez. 2020, 17:=
34:
>=20
>         Hi,
>=20
>         I am working to get jailhouse work with my R-Pi4.
>=20
>         I have been using a 64bit Debian buster rootfs with
>         a custom compiled 5.9 preempt-rt kernel.
>=20
>         I have successful reserved >736M for jailhouse and inserted the
>         jailhouse.ko, but when I do jailhouse enable I got the following
>         error on uart.
>=20
>         Any suggestions are appreciated.
>=20
>         Initializing Jailhouse hypervisor v0.12 (223-g097bed0f) on CPU 1
>         Code location: 0x0000ffffc0200800
>         Page pool usage after early setup: mem 39/994, remap 0/131072
>         Initializing processors:
>         =C2=A0CPU 1...
>         FATAL: Unhandled HYP exception: synchronous abort from EL2
>         =C2=A0pc: 0000ffffc0203864=C2=A0=C2=A0 lr: 0000ffffc0203850 spsr:=
 200003c9=C2=A0=C2=A0=C2=A0=C2=A0 EL2
>         =C2=A0sp: 0000ffffc0222e40=C2=A0 elr: 0000ffffc0203864=C2=A0 esr:=
 00 1 0000000
>         =C2=A0x0: 0000000084000000=C2=A0=C2=A0 x1: 0000000000000000=C2=A0=
=C2=A0 x2: 0000000080003580
>         =C2=A0x3: 0000000000000014=C2=A0=C2=A0 x4: 0000000000000002=C2=A0=
=C2=A0 x5: 0000000000000001
>         =C2=A0x6: 0000000000000029=C2=A0=C2=A0 x7: 0000ffffc0219ec0=C2=A0=
=C2=A0 x8: 000000000000002a
>         =C2=A0x9: 0000000000000000=C2=A0 x10: 0000000000000000=C2=A0 x11:=
 0000000000000001
>         x12: 0000000000000015=C2=A0 x13: 0000000000000001=C2=A0 x14: 0000=
ffffc0219000
>         x15: 0000ffffc0015040=C2=A0 x16: 0000ffffc020da50=C2=A0 x17: ffff=
af45951e7518
>         x18: 0000000000000001=C2=A0 x19: 0000ffffc0222000=C2=A0 x20: 0000=
ffffc0219000
>         x21: 0000ffffc0200000=C2=A0 x22: 0000ffffc0219000=C2=A0 x23: 0000=
000000000001
>         x24: 0000000000000001=C2=A0 x25: 0000ffffc0222000=C2=A0 x26: 0000=
ffffc0223000
>         x27: 0000ffffc020f000=C2=A0 x28: 0000ffffc0218000=C2=A0 x29: 0000=
ffffc0222e40
>=20
>         Hypervisor stack before exception Stopping CPU 1 (Cell:
>         "Raspberry-Pi4")
>=20
>         PS. I did noticed there is a similar post, but it has no solution=
.
>=20
>         --=20
>         You received this message because you are subscribed to the
>         Google Groups "Jailhouse" group.
>         To unsubscribe from this group and stop receiving emails from
>         it, send an email to jailhouse-de...@googlegroups.com.
>         To view this discussion on the web visit
>         https://groups.google.com/d/msgid/jailhouse-dev/f0e8ee0a-e874-428=
e-a97c-91524477c7e1n%40googlegroups.com
>         <https://groups.google.com/d/msgid/jailhouse-dev/f0e8ee0a-e874-42=
8e-a97c-91524477c7e1n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfo=
oter>.
>=20
> --=20
> You received this message because you are subscribed to the Google
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send
> an email to jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/126f7b0c-2fa6-4329-bb95-b=
ddead90c9f7n%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/126f7b0c-2fa6-4329-bb95-=
bddead90c9f7n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/b6206c2f-ea42-a3ec-d95c-5e84931ece21%40siemens.com.
