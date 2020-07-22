Return-Path: <jailhouse-dev+bncBCFLNWPPWELBBMV3374AKGQESBNK3CI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EA92290E6
	for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Jul 2020 08:33:23 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id o9sf130101lfi.23
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Jul 2020 23:33:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595399603; cv=pass;
        d=google.com; s=arc-20160816;
        b=vRad37kk4mVt9WRSliHHRD87Dk/RmMnX0daeGs7xiOb1F0/bCmWyV+mxEnMAtwS1Wp
         tOCGYZnqmrv3/SdLnKWlk/yvyKqYmUen/1c3qN+Y4giab7CuLRYuuQgb2q8k4bB8BmAX
         toeJeSBFd1RYV63dnZE5WV6cG4+JaF4x2fv4I/xg1svcjmT3zSs1P3EuTOJuasc0qWxk
         h+nqfb1kWZ64ypHpPwA/edaPczxSccUWrDGGFymaW1wRO2ClwP3LRgPmMFLKGUZYk+Ig
         Bj1NqXDPNt4CZYILTxyDun9e3sM+I3S0bS0FIzpBl9TvLKE8X/uIaKUSdckDTlXckjwp
         H5bg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=JR4z3Bwdaa2gwHqXHwPFzqCrGcUlN6XqRwED2CWpeU8=;
        b=yJ2JfaqT0UxUSD9rgjxKceHU9rRqtLZ7QEV+BdR/43ygy6QvivLO4pew8Hh7Ne0Ubn
         EaoylQL3nriNUd+rNT9+YkGMDqi/U2ygqsMgvCNVIf2kDXu5Qo2I4fC7ayKXht+L+gAM
         Tiiyam42RUD3znSI5pUqCakE6b0P0L9rm77zcS0jS68aFeAybVKVGdpK1MCHiu+v63zP
         8oqLt4oVVLM5Ss3hl+s1Rzy0d5D3RweIUeFIyllTGzL1hU0G17ZWOW6GlAPabvNTsQF1
         Tx5XGngx5fTqcRuI53AiYW4Q8ZQfCdl5p/CXxpFQv6jXOGO/i71gnkjQJcTRL0O6uQiF
         Vuxg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Lx8I1Gi1;
       spf=pass (google.com: domain of prakharbansal0910@gmail.com designates 2a00:1450:4864:20::62a as permitted sender) smtp.mailfrom=prakharbansal0910@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JR4z3Bwdaa2gwHqXHwPFzqCrGcUlN6XqRwED2CWpeU8=;
        b=f6yFJpv8ghC0758cyK1JQJzhRmmQUtT6HvC3GcS4pkgFFi1bAhJvcPZXETHi3xM9t1
         s6jbclNeqel8I9aIjgvTOb8V+Ccyxj5SvB7c06VdBAKHdbgC+Yqz7UJ8NDNWxoVIIi5q
         m1/Hkf+da39DsE4XODyixarBAeLCvD0vOyC3WkechbEBCH/sEQ3eZ5Lly+xULx+o/Oo9
         /V5ijlXoUgVwSjVjAA5HImPSgcGSL5E+9MG/rI48C01CcYCp5B0xE5H7VCvLe0LmRcZ0
         fOsyFeosUZEapZzJX6J4Zyh59BGSNiy8S8kaXFVhH1/UWzkM1bzMSNYfceNaUhq6esXf
         8oYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JR4z3Bwdaa2gwHqXHwPFzqCrGcUlN6XqRwED2CWpeU8=;
        b=BAlg78kwkeiMNEjp7h/y4ByIoJy17a2HG9wgoAUMa2b9Q/jgwrVY/6VgiMS8+pNx97
         27/1SSu6xUbpSzaGk0J/oWvY0qdRF//xcxa1O1ocjDMfusA+LF1WH2YG6y9p84FkUL32
         pBUYIlGLsHSHQ7O9A/xN14xd/XMcThi47pYN68YFDuaKqe7Nb/pqP+u3tcqAu9tzAWRd
         H6dNqeLn+2Ydo0aT/2FEnxlcUkG6rPrQJOw5qgkDeTZ8sTpIztgxaWqwN24fauLNSw6F
         bRR81EoJ7Xft1vjhheWqCj7vVMF2LFOSbpPwwPiCdihOraah2hNgMesSK27Zm+e6vvRk
         9dGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JR4z3Bwdaa2gwHqXHwPFzqCrGcUlN6XqRwED2CWpeU8=;
        b=CDXixCyDa64HCFsvWUrOhJhLPV05yB5xsFdCbH8dCwAGIdun/IEslTxazxnhKny1UO
         cA4qfUp/7H1rZSQRR1G1sVsJyZSqSz+vlK43ohLsbq67Y6RlLwCIThXuV4J7NBw09Ymc
         n00EF+j51pqow0euhwzb1qysj9hihXSYT7vaXs3Bzg7x4RHGhkMNNpHFAZq8lCiQ3B47
         B2NUUS0p7kseVgAI/Wgu0hkepIqdjhN1IGAjkzVpR71YZUSYf7WPLrIyCFl2Ohx3H13J
         a/+LB/aX+k6fTPVGAfWXedU9hPPIrgD7znJkbJRRDkL6rMCFGNz/CPm3cNqU5D6F1gVB
         zj6Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533iu3jD9WEJ8rzU6+BST8ykXUcNvfHn0f4F+Pdbg5e5/yiZ3g7S
	txBFl7jNr0R3CVmSNZfaSJM=
X-Google-Smtp-Source: ABdhPJxzL7qfRw/2MelJcxtEm4kqF7ZRqHmfi4AXFQWPFE3e6RySsk7KR09GrBrnCHsgdOFFnjWX+Q==
X-Received: by 2002:a2e:5802:: with SMTP id m2mr13872351ljb.289.1595399603100;
        Tue, 21 Jul 2020 23:33:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:28c:: with SMTP id b12ls175916ljo.9.gmail; Tue, 21
 Jul 2020 23:33:22 -0700 (PDT)
X-Received: by 2002:a2e:920e:: with SMTP id k14mr14959641ljg.430.1595399602377;
        Tue, 21 Jul 2020 23:33:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595399602; cv=none;
        d=google.com; s=arc-20160816;
        b=kAgr7OhTBOspIpEGPuix5pcQRXeKTlSd3ni1AWnTOjIqQs3Q+D/Tf6p2PXvJn8CCEN
         xSmaI4S3W3AtBXd0xCgWRm80XKZSdhDcmeAUjENUkMn7qgdedwxN+pe1z8DA6p7S2IKv
         HWPQWUd2tOJdejhLFGkqN5H6Uny9AXCSU3aWkTAVeic3WemXJev/IVoLekKMONk0Pi+u
         O5Nl8IkEtr1FwG7rDdzej4XYeR3Hh/x4L+gHf4E7oz+rLGPNTWeG8wdka6qKHfxSA5v7
         O51sDyRdHbG4iuMcNM3K9UFllXsm1jEl22w/70UiOi1C8u355iQvtJOaoZI+CF9FXFXq
         N3hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=p5+DdxfWj6n7Ji+PQDNpoGJymk+e++Ym8qswBO8BSaY=;
        b=YTQb6atKx0wnXyBAQ5rciM4Vdcf0REZsO3bQRd2w96cLkWjiNduF6mJJmslHiT0vh4
         TmJ27thnQEIniDWt9FSMlbkEXW7Zv4wa8wc+d4yGLHFWgXfAi1JNzTuGFqD8REPE76cT
         5Sx8SmWT7b2rooQ8p21gTdRfnA9rH9Cf7k1npo4fhDEzUxsMDccCl/2TPMTD1sQKoeHA
         8W/4lyT4jsYtIquwGLQCp9nkyyJtzVYwwWJ4Ycv7mkkl5cC23wa/FMIoW3U5TS3+qzNL
         NpAlPCdwLKhG2szgDMDinotE+kCaTmBNX81Zhm/xv1hRzmI1BO1mMmruNddikNCk31zh
         DO/g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Lx8I1Gi1;
       spf=pass (google.com: domain of prakharbansal0910@gmail.com designates 2a00:1450:4864:20::62a as permitted sender) smtp.mailfrom=prakharbansal0910@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com. [2a00:1450:4864:20::62a])
        by gmr-mx.google.com with ESMTPS id s3si482221lfc.2.2020.07.21.23.33.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2020 23:33:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of prakharbansal0910@gmail.com designates 2a00:1450:4864:20::62a as permitted sender) client-ip=2a00:1450:4864:20::62a;
Received: by mail-ej1-x62a.google.com with SMTP id n26so1002858ejx.0
        for <jailhouse-dev@googlegroups.com>; Tue, 21 Jul 2020 23:33:22 -0700 (PDT)
X-Received: by 2002:a17:907:728a:: with SMTP id dt10mr27815367ejc.150.1595399601871;
 Tue, 21 Jul 2020 23:33:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAD6ScS_uBX7NCU+VinzamffEFH_kfh4B-MfR8nxt7+5VuNpRUA@mail.gmail.com>
 <0d84ce9a-60dd-c81e-d879-a278c8602054@web.de>
In-Reply-To: <0d84ce9a-60dd-c81e-d879-a278c8602054@web.de>
From: Prakhar Bansal <prakharbansal0910@gmail.com>
Date: Tue, 21 Jul 2020 23:32:45 -0700
Message-ID: <CAD6ScS-U0Rh_yWeH-DhRXT587ndXpJZ1m9=9-_uDOGPehzHWhw@mail.gmail.com>
Subject: Re: Libvirt driver for Jailhouse- Test set up in jailhouse demo-image
To: Jan Kiszka <jan.kiszka@web.de>
Cc: jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="0000000000008b63aa05ab01ea92"
X-Original-Sender: prakharbansal0910@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=Lx8I1Gi1;       spf=pass
 (google.com: domain of prakharbansal0910@gmail.com designates
 2a00:1450:4864:20::62a as permitted sender) smtp.mailfrom=prakharbansal0910@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--0000000000008b63aa05ab01ea92
Content-Type: text/plain; charset="UTF-8"

Thank you, Jan.
It works.

Thanks,
Prakhar

On Tue, Jul 21, 2020 at 2:12 AM Jan Kiszka <jan.kiszka@web.de> wrote:

> On 21.07.20 10:14, Prakhar Bansal wrote:
> > Hi Jan,
> >
> > I am not able to set up the test environment by mounting host folders
> > into the jailhouse demo image- QEMU/KVM Intel-x86 virtual target, as you
> > suggested last week. Since this demo-image is created directly from
> > QEMU-system and not by using Libvirt, I can't manage it through
> > virsh/virt-manager.
> > Also, the space in demo-image is not enough to build Libvirt inside it.
> > Please help with the setting up the test environment for testing the
> > driver in the demo-image.
>
> Try
>
> start-qemu.sh x86 \
>    -fsdev local,path=/some/host/path/,security_model=none,id=vfs \
>    -device virtio-9p-pci,addr=1f.7,mount_tag=host,fsdev=vfs
>
> and mount the host inside the guest like this
>
> mount -t 9p -o trans=virtio host /mnt
>
> Jan
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAD6ScS-U0Rh_yWeH-DhRXT587ndXpJZ1m9%3D9-_uDOGPehzHWhw%40mail.gmail.com.

--0000000000008b63aa05ab01ea92
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you, Jan.<div>It works.</div><div><br></div><div>Tha=
nks,</div><div>Prakhar</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Jul 21, 2020 at 2:12 AM Jan Kiszka &l=
t;<a href=3D"mailto:jan.kiszka@web.de">jan.kiszka@web.de</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,=
204);padding-left:1ex">On 21.07.20 10:14, Prakhar Bansal wrote:<br>
&gt; Hi Jan,<br>
&gt;<br>
&gt; I am not able to set up the test environment by mounting host folders<=
br>
&gt; into the jailhouse demo image- QEMU/KVM Intel-x86 virtual target, as y=
ou<br>
&gt; suggested last week. Since this demo-image is created directly from<br=
>
&gt; QEMU-system and not by using Libvirt, I can&#39;t manage it through<br=
>
&gt; virsh/virt-manager.<br>
&gt; Also, the space in demo-image is not enough to build Libvirt inside it=
.<br>
&gt; Please help with the setting up the test environment=C2=A0for testing =
the<br>
&gt; driver in the demo-image.<br>
<br>
Try<br>
<br>
start-qemu.sh x86 \<br>
=C2=A0 =C2=A0-fsdev local,path=3D/some/host/path/,security_model=3Dnone,id=
=3Dvfs \<br>
=C2=A0 =C2=A0-device virtio-9p-pci,addr=3D1f.7,mount_tag=3Dhost,fsdev=3Dvfs=
<br>
<br>
and mount the host inside the guest like this<br>
<br>
mount -t 9p -o trans=3Dvirtio host /mnt<br>
<br>
Jan<br>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAD6ScS-U0Rh_yWeH-DhRXT587ndXpJZ1m9%3D9-_uDOGPehzH=
Whw%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CAD6ScS-U0Rh_yWeH-DhRXT587ndXpJZ1m9%3D9-_=
uDOGPehzHWhw%40mail.gmail.com</a>.<br />

--0000000000008b63aa05ab01ea92--
