Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBMP2577QKGQEBZLXRVQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8992F0D26
	for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Jan 2021 08:24:33 +0100 (CET)
Received: by mail-lj1-x23f.google.com with SMTP id j16sf999501ljb.9
        for <lists+jailhouse-dev@lfdr.de>; Sun, 10 Jan 2021 23:24:33 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1610349873; cv=pass;
        d=google.com; s=arc-20160816;
        b=djrihu+R0x5ffCb1JSettG9iqxBNvOh/2Wf/UjVjbUJ52jxBGmICQJBDNqCj+TOh8j
         wSTLG0KbORJPds2DVzAeaVFJP4Sm6rTTxbrFild/wPAxneYHAEnLLBywM3VHzePJZkuM
         TegNkTbOe9GKA1ywLUNbUCmXjCAAvEjq9EiA52wrynPyhdvrQZoxvcG1IdoKrxdGuKLR
         SwNaz+Q1JfIU/LTeu15OesK0802FLP1ENqzzMb7JYpghpKM8IYcFavv9FTuasKhdJQiQ
         GrRSAYVA5rLY6I+A762194mvO1/bCr0bTUNm6UzBHWsM1vzVVXdgHSuS/mk9fx6L0Kqx
         s/jQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=ThKzEFrr6FIGS4iOJ9dlBrfT33d/SsyOA1WGX1jSEUA=;
        b=HnVlH3oZ9NDwJWFdpM9/DVXT/a0ck/LjnGi8e92dFgTligdTmtv8EY8wKqVLQ5HMeD
         x8oLg/laVT7DVrkNB5H0gqjPa8AoLb7EBZ8T8xee2Fzgvd35zoieHaNcaDnX3/waRGKf
         5r5MS6GkRddS+U7oITSh9C3jl698y0GiAJSTsBdNiO+gKov120COkWrvSVQd/YDiLkCd
         Co1y+kUHBoJ10+LEyKu24wY+3oxc2kcbEX6Gizb9d1E97/HaJF7g8apaeSu5M1diSzW6
         ciURwLd16N8b/mzMl6HdjxTHrYaC1I8OL3zJ9/XnLHKNnCGSZhhxJFsETWt1SawkOxFh
         TPRQ==
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
        bh=ThKzEFrr6FIGS4iOJ9dlBrfT33d/SsyOA1WGX1jSEUA=;
        b=XojUKvPQxiXRoGgT9mlIVoKLh0xnlBaFegscUq7kCiAThdp8QRmojDmsQ1+zUk7RJM
         UluS4dEkvR5Cf989xreN7yAs7evHHVeqqOFm0a+WS9PzKKNhG//JArl0clCIW4dd5x4q
         05K4qPlBeCViaZNoxizK2CuZh5ZqNBYZI4CHRNEAsnTOmR/vFEgREFZ1cfj99JogQCvF
         VQJWg1rn288ID6keZPh0v0+SI4JqMYwUssQjtbmYM0V/I55slEvCOmZr/CHYueuqJAY8
         gJR1wrDKIT4qaycP6Wc4+YEEzN9LT5tj+Hy5+9yypJkgUnXzYu9XDCOWEv7jOFyOFPTR
         Ctsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ThKzEFrr6FIGS4iOJ9dlBrfT33d/SsyOA1WGX1jSEUA=;
        b=AoMY7Bi1Kds6Bpjs9+/uHLt5G2MiQl698t9JXm5/o0CKt8DGQSuItZEHeCdyMJ/y90
         uTIFJF62ozT6/Tr5ppH+pM4PbA9v1SFyOEjGQTPF59AWbmClOc/UV9CmRd8R5QFyGPdE
         yxWNGGedsAtopIHmgWBdeh0swoLLaw6vr0ePxZkRvI1oYxbZTr6Y/ZfYINk4JHIcSwkH
         QQH+tcD4Liop8GMQCOVO5081+3n1f10FkbNBTPfoPdNLJejjjDSdgGTCaa66tQxmcOlD
         Cwx9DC/A9fu6Cadao1juP9F+vjIDikTVefsXkD2Lm0PC+4fx0ppFeNcaVtPZp619jhDJ
         KT4w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532GwGP1/TCeaN+4h673J0TwsT4DBerfWP3QNAuIdo0KuSOnBRl8
	xOC8J9A4wArt6o1VH4FW+gk=
X-Google-Smtp-Source: ABdhPJx/sDX8TCqJoCl95WaIcAbAoan8I9DwxXkeFpeOGql72vNHwhbJV7MZLKg1B36s/iohBCzWgg==
X-Received: by 2002:a2e:8250:: with SMTP id j16mr7233280ljh.354.1610349873292;
        Sun, 10 Jan 2021 23:24:33 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b549:: with SMTP id a9ls2765413ljn.1.gmail; Sun, 10 Jan
 2021 23:24:32 -0800 (PST)
X-Received: by 2002:a2e:a364:: with SMTP id i4mr6682293ljn.426.1610349872194;
        Sun, 10 Jan 2021 23:24:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610349872; cv=none;
        d=google.com; s=arc-20160816;
        b=m1Y2616Q77xQX4KX6hcyT/Moj7ZjW0+sQK0f3goo8Ls/u6K+YJ6I1SctynBh7cfUoY
         adB42ncBvd3G5y7CTAFCLFJ4a7c/tiyu04LC+lfgekFVr2nN3vpLCK2ex8f7GX0oNN/j
         /GmdVClrobKdRsdebY81mlsaOuqZ71/RNEXnMT1dFE/Xlo6EfbF4EOSjXLhiu5Pt1/yR
         l6wQmGEBiT/FWOcBpTO+USEPr1DUaYVFSFWf38xjVj8f7PdIwMrUajNyr3KASsMmKpjl
         nuXcr/gUP8K2tOKn6RMRU5HNUK6Lz1RZqVWDGldAKVFC9DlQWyPUsxrlWzoAk9B5y0oK
         y7ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=AmoNvgiaEHWD52r7T+nITTNbhh4v+QpzziNe9uPr+Ik=;
        b=Aeb4gAfDk9T1GxuZJHXgNWWD5i9KSe80E6o2GudcksUT8tBA+aJt17aZVFrI7rtq1U
         QxdVzAMEHtcL2SU5HuP+d08P5WSHwEYmCh15LjUtyR+LddlflGIhDlvXzHESSPJ3au7p
         bNBeg+PzKnG0YIUWMkS4JiUykGVGQJfQrj793WCx+ytP+2vcLUcDYCvDXLhmKZ11xcB2
         m1LUsEcyPTEZBAgp5LEelPDmjzCHAEGsbontT8Eziq9V2+msMR8Use1eBt6+qQdY+0UM
         E6tWo2juXv54TCNPSIpew0JbOTzVLc/YCsCxPXiwtrYnLIW4si7BHHl3uhAkfSK/P8R9
         7Wdg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id e18si798240lfn.6.2021.01.10.23.24.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 10 Jan 2021 23:24:32 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 10B7OSov002267
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 11 Jan 2021 08:24:30 +0100
Received: from [167.87.43.185] ([167.87.43.185])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 10B7OSkn024618;
	Mon, 11 Jan 2021 08:24:28 +0100
Subject: Re: Error when testing linux on jailhouse
To: Richi Dubey <richidubey@gmail.com>, jailhouse-dev@googlegroups.com
References: <CAAQOZwwfhYMoBMnqk1v4THup3t6kxA+V0tgWS7xqduuGb6ZxPA@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <e4de1075-d9d7-a666-7b4e-4511d2f81111@siemens.com>
Date: Mon, 11 Jan 2021 08:24:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAAQOZwwfhYMoBMnqk1v4THup3t6kxA+V0tgWS7xqduuGb6ZxPA@mail.gmail.com>
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

On 10.01.21 10:41, Richi Dubey wrote:
> Hi,
>=20
> I am new to Jailhouse and am trying to test linux on jailhouse on a Zynq
> UltraScale+ MPSoC ZCU102 board. I have copied the Image and the rootfs
> file, but when I try to run the command:
>=20
> =C2=A0jailhouse cell linux zynqmp-zcu102-linux-demo.cell abc/Image -d
> dts/inmate-zynqmp.dtb -i abc/rootfs.cpio -c "console=3DttyPS0,115200"=C2=
=A0
>=20
> I get the following error:
>=20
> [ =C2=A0536.015073] CPU2: shutdown =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0
> [ =C2=A0536.017777] psci: CPU2 killed. =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0
> [ =C2=A0536.034988] CPU3: shutdown =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0
> [ =C2=A0536.037680] psci: CPU3 killed. =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0
> Adding virtual PCI device 00:01.0 to cell "ZynqMP-linux-demo" =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0
> Shared memory connection established, peer cells: =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0
> =C2=A0"ZynqMP-ZCU102" =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0
> Adding virtual PCI device 00:03.0 to cell "ZynqMP-linux-demo" =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0
> Created cell "ZynqMP-linux-demo" =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0
> Page pool usage after cell creation: mem 82/994, remap 5/131072 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0
> [ =C2=A0536.066780] Created Jailhouse cell "ZynqMP-linux-demo" =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0
> Cell "ZynqMP-linux-demo" can be loaded =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0
> Traceback (most recent call last): =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0
> =C2=A0 File "/usr/share/jailhouse/tools//jailhouse-cell-linux", line 857,=
 in
> <module>
> =C2=A0 =C2=A0 cell.load(args.initrd.read(), arch.ramdisk_address()) =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0
> =C2=A0 File "/usr/lib/python3.7/site-packages/pyjailhouse/cell.py", line =
44,
> in load
> =C2=A0 =C2=A0 fcntl.ioctl(self.dev <http://self.dev>, self.JAILHOUSE_CELL=
_LOAD,
> load) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0
> OSError: [Errno 22] Invalid argument=C2=A0 =C2=A0 =C2=A0=C2=A0
>=20
>=20
>=20
> Can someone please help me with this? I saw that someone else also had
> this
> error:=C2=A0https://www.mail-archive.com/jailhouse-dev@googlegroups.com/m=
sg07264.html
> <https://www.mail-archive.com/jailhouse-dev@googlegroups.com/msg07264.htm=
l>,
> but I have not modified any memory addresses.
>=20

Which revision of Jailhouse are you using? How did you set up the root
Linux system? Does the kernel driver report anything in system log about
this error? If not: You can ask Jailhouse to report the origin of errors
via CONFIG_TRACE_ERROR, see Documentation/hypervisor-configuration.md.

Jan

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/e4de1075-d9d7-a666-7b4e-4511d2f81111%40siemens.com.
