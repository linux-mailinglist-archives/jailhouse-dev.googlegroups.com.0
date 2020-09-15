Return-Path: <jailhouse-dev+bncBDRKPIXWWIFBBGGQQH5QKGQEBEYCHGA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E60269F1A
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Sep 2020 09:07:05 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id s22sf679044ljp.15
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Sep 2020 00:07:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600153625; cv=pass;
        d=google.com; s=arc-20160816;
        b=enmt/ZS8z7g3wp4a3DB/bxT932dAS24DgWamnkO3r6eib0pqnnTDmaiKZsIg5L3bbm
         DGg/0d3JuJwO9nBcY2OdpBnt1iCXvSrabyswy/uC8CzxANoEhKzFKv/haTP3KmNOTp7Q
         dySxLtGSnIL6ZymPyzRq/6Xj6KS0tq0Xyi+UG+4SJh2PKLAOca+GKkv+EWLknymHiF0S
         vKWK1ful5fuHcYaBUisuR1KpqCXy3wEOYn0gL/LGw4IYxGOgN4bpxkYzggFRjPr7wd0I
         sKYs8qP/enCODg815vnV/rfjDxWojGRRFRSRhkQM6gWN5yNeuVE0DyWLVV759cJO/eCd
         SrTQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:date:message-id:subject
         :mime-version:content-transfer-encoding:from:sender:dkim-signature;
        bh=D5qMM/0dDg3jVZDVfW/96F0Ynp8tyXh8xBFyM/XwCag=;
        b=iyoMm4bmAKXzXRBdYOoHA7x9EJqPtMFtaGdMXKv+JzWrZeZdOWSWdBpNottQfubvSz
         ovbLyQL0tqA+9ZSSfbk/DQ/D1EMKUYitZFXmd4hHjRHxvuIw5UW6PniGPjpxmn4TUJ2V
         4ymjANYY7zlfch4nFi36p0XDno1bXl7ej9QjcZGG/yKQ+ugc5vSJAoDR5z4onA2fZh1F
         fhG1o2A7NlHoDTKRj+Hvz1rCk9z8mHjuMsunUhNaYMMLH9fnvbJGFaHBv3YtUUQhpg9F
         rdqppcl/yhIHAD4E5pXIPt7rna5CWwnzOKKnrEH5YSckLFigIyBvnxnSLnxsPQZlUOMf
         ALTA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=T+BKpzw9;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.15 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:content-transfer-encoding:mime-version:subject
         :message-id:date:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=D5qMM/0dDg3jVZDVfW/96F0Ynp8tyXh8xBFyM/XwCag=;
        b=M5ncbD5pQqtjK/MPONBywtQorf1EBMIAS2Kr8Xo+Oer53DPMFpxRKM3pKoJf9k5HWU
         d+cGpA4D9x7pZrygB+V29feuPlKd4q6/h+lcyx/0qMdp81KCTlXuLlPT1Uc7rvbk+QoV
         rbTi9a2dyzQf1W1w3L5tzEsL4vURzTC/xlWtYvUSh3ccbdexkjPPW/ru+L8IspfKwblB
         v9lo+c52+ObdlK58B3WUB1THq3VTwq4OgPzca2lhhIGISBirxXKhf9ankfwWFarFpPTv
         JYEf/hcHhhHmE7cIo03gkl5TMm5t7r637be7hV7QQCcB0hKMayXrLUx5NM+xkmqfoSgd
         6j+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:content-transfer-encoding
         :mime-version:subject:message-id:date:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=D5qMM/0dDg3jVZDVfW/96F0Ynp8tyXh8xBFyM/XwCag=;
        b=Q8GnPhcFc+9IIAHQ8EvwCERhzhFwiFD2rkJ0uzTrZw3ip+DAFrOfplyvG6shptN1HK
         gUm0nJECNnng5x4iYm+ifg/emOZ6vLD+CnEDR81gVLGsjWWrONF+aF9Tch07dd9wwGd3
         kOfSjM6JfycGEKi+mZCzHeUSfvnvofvmFHihWdypKyCBIob7DjRqe95KAHnyfpICqSvh
         cz0J1FFLULNv/3+rgq8ViZEIJnAkZXC0g3aw2UyALTXQOWP52pTI8cr8TMNFZM/nPSe1
         kfMQryvxVpUWi++OHlSH+3Cf2EB0KDgsYMp/Xq/jyj7eWPN6/JDDEgDO9MRX3R+dTnZf
         fn9g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530zUayqytLyxAxEuzFb46rxw/BzBjJdTZ5sZb1D3t+2JHT/obmE
	VFoit7Z57SXZrLSJK/v/Nrw=
X-Google-Smtp-Source: ABdhPJwPQvMyRJnUPqq9ms5hfDmUEnaXQ8b56lhhWECLOyyCKLWj92PZuQpKiLevHOPq+0c7KAjpBw==
X-Received: by 2002:a05:6512:214c:: with SMTP id s12mr6471958lfr.18.1600153624988;
        Tue, 15 Sep 2020 00:07:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5c44:: with SMTP id s4ls554683lfp.3.gmail; Tue, 15 Sep
 2020 00:07:03 -0700 (PDT)
X-Received: by 2002:a19:5e5d:: with SMTP id z29mr5797165lfi.32.1600153623672;
        Tue, 15 Sep 2020 00:07:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600153623; cv=none;
        d=google.com; s=arc-20160816;
        b=UHq4qZsyn90RwpCSi/Ber56I0dV5/Rn+9BQScyF7bzxXFqttOUXZVHOisnSrWvUQ0e
         XaW89RJqOIbr7QJ1XBppEftvlWBFuG0EP4LnwfqfbXH9v15rNc7jWSMmcAUdlNGLo3Cm
         e9y7miqDo9K9kHojTKDh9wU5kHOcQBlEPXSrEubvx8T1PQDa0sXrWrNbf3EYXfvFOwBb
         uOMGqYh+uTr0Qopg2bXZW43QTJe1XbUpc/7r0m7lhD9Qo0b0hdo9Gz3bBPKrGCJ8QHMH
         Ueld1NYIx3IcYtgT9wX+cd3bKFzXVJZ8gN+oTT6jtvmYnnTlYF5Zts0plEpLqoJCkr4P
         ZbyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:dkim-signature;
        bh=1deTf5wTejxCF3v7dV7OyB1akSlLazp6uRYJcfu1bJY=;
        b=o1L+BCLAXS0Rohaz7etOtQwrH2/+cN88b/nhAG4kD4pKJ5l8p5BAGs4rW2UUFlL2dZ
         GdfrClxY2K7CUHiNnxtvkVDUg/H095RMrHsGpHm8xW/8b5LfupfF21xnKebN6KvuVTux
         kHxTR9JyJtlczM9spFhyiVbhjBxDBV4xYORf70U09NSF5u2YsU+jiV6Ew1nhZfB/D2Dw
         ZiWCp6vcks3R1sJQlBL1PqG4xeGzt0Gzl2Ovj73u/QBuSJcLj39FaDFxSL2WfqFx2Qnh
         IHsQPIKwvEksW83rceqrOm3Fx8vOrqhuwYy9fAuUA1WFlGfGU0i6yedYbYLuFDXJGb2D
         ge2Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=T+BKpzw9;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.15 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
Received: from mout.gmx.net (mout.gmx.net. [212.227.15.15])
        by gmr-mx.google.com with ESMTPS id d1si248024lfa.11.2020.09.15.00.07.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 00:07:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.15 as permitted sender) client-ip=212.227.15.15;
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from nethserver.fritz.box ([5.149.23.5]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MAOJV-1kCGZZ3t5n-00Bu81 for
 <jailhouse-dev@googlegroups.com>; Tue, 15 Sep 2020 09:07:02 +0200
Received: from [192.168.2.64] (unknown [192.168.2.64])
	(Authenticated sender: oliver)
	by nethserver.fritz.box (Postfix) with ESMTPSA id 65CD6202544E
	for <jailhouse-dev@googlegroups.com>; Tue, 15 Sep 2020 09:07:02 +0200 (CEST)
From: Oliver Schwartz <Oliver.Schwartz@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: arm64-zero-exits trouble
Message-Id: <91E9F831-4F9A-4444-AD9A-3E5C56D3CA70@gmx.de>
Date: Tue, 15 Sep 2020 09:07:02 +0200
To: Jailhouse <jailhouse-dev@googlegroups.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
X-Provags-ID: V03:K1:R4X5e6NMhzPQsa8whKlB7QFZ7SxBlE4y+lJlHaDfRKU/U3b2x4p
 yf11DqG7XA0B566LXGWOwNgT6SN25AGmUt4IVFpUr1624WbiubiIEMzfBVeXD2uuhEPiKPv
 yBLADtKyoYJqZhsb7GqSw/4s6dayhLMxhEX2LunqU2frbYhMDlKlD2knqyWRbEQYKsEeAii
 ZNcSRtTuaw8n/DRXVrw+Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:aMqscllBGAA=:n+6XRPsZU2OtAZdEATuIcO
 2Rcs4gFOYTCt4UaFLNPdcVdpw0NW+2AHlvkioWxR9AE7jt75VuKRpDar+ffLKAltraylFGxJD
 CJV+yuJiRaaGGJSxfB8qPCTyiRDzW+Lj0QQqlLuThXd6RT1MpzzS3EkTLDQiH3aBuAt8LrmgP
 2DOwnLrG9LDgkqGKs4ViThkIDkCYplqf9eOTuIiH/jZV3ADnfjYFbD/r7k27abKMOfmsqngU6
 37/QnvF0kBYIjk2O9m/gduvSUvUS4XDVEv5NYys+muxw81UgeQzcXMBxzMXfL7Asy8wbI0ok+
 8R/ZGtbJM2qRfpOZVOsSVKcO+GwBm34FZS6cRcd/L7rGJYo0WvwPAKZcp+fearaD/AiVuNVGV
 I+T7rFd7zLvqocc3oOdescE2XVlVmtMGj1X3mWBIU7MLZNWN8wJdyf5HP3UVfshJNfM2SIyDM
 //0HBaLMWRT9O8tHip7hNK18cZUMZn9rUgJf86GlFkJJqR8KK33v1WFma2+WiJ+iUY9nMXLA1
 ydkn//o+NhrFbKIlo0fAMgxAS4l3BgvCslexlP8/9EpFZvdG2D6ru0TILyr0sXrW2I8Ev693j
 ljVjIuhwgg6beFLQ8jn6cDkZFgp89h3fCf3uLGvfy0GFWFkkxmqmMhQqEmY48QpVWKykU4z4l
 nIOIBN+hpCE0SRmz82cT9WWFo8Rmvj2OVXZrItHHfrcC0tf1UNOSND9C72849NL/F1Un1ZWFv
 OTwMDg0HYPt1CYm76fxUUWS9LBcJ01NhhtdpLesRP3DG0iqUDhcGo3QsUrzdMJ8HM7Ih9iHCJ
 56UCpe43Cbyu6XsjoyF9jYrBcfKsIKB0dglulyR/mYqpX7DpCOhONFZaIMQQrW/yLQeFutZ6H
 TnL3mc4TWJlnYp4zXP+kA6r1fKgx9gxBhyTtO0GK+PPsHN0KD/+Yzjc+daf1QMS0APNtar7zP
 +Hd/j+qbasO7iz0cPLUim/BSoOlZJaB6QJuctSNyluOa0rjjfcNi1IdYYNRy3SjdJ3BEh02qb
 8mMp5tPHuM5xIP240ZbzFAuQPWyJkdk58PrCW7Z30ZQY2CgxmWL8hC9LHC0CzVtppk8hZKUS0
 Gex0y7BRiW4zL+unSuqe1uElpoOn9i2qqDgeKpb2jm/tIHP5QwCJrgyU2a0cjaQLIkGQYRQML
 tpwxrNemJuq6ScJ8uySai/Nt6lX3KpDjgRbjPPfKIMnIaZ5phZFSGK+BMt/3gISHzG+e32Q4n
 58+IlrOGlGWaijGpM+MN2Nq4Fwx6FyIkv8f5vog==
X-Original-Sender: oliver.schwartz@gmx.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmx.net header.s=badeba3b8450 header.b=T+BKpzw9;       spf=pass
 (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.15 as
 permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
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

I=E2=80=99m currently trying out the arm64-zero-exits branch and got stuck.

System is a Xilinx ZU9EG on a custom board, similar to zcu102. I=E2=80=99ve=
 brought ATF up to date and patched it with Jans patch to enable SDEI. If I=
 don=E2=80=99t enable SDEI in ATF everything works as expected (with VM exi=
ts for interrupts, of course). Jailhouse source is the tip of branch arm64-=
zero-exits.

If I enable SDEI in ATF, jailhouse works most of the time, except for when =
it doesn=E2=80=99t. Sometimes, =E2=80=98jailhouse enable=E2=80=99 results i=
n:

> Initializing processors:
>  CPU 1... OK
>  CPU 0... /home/oliver/0.12-gitAUTOINC+98061469d0-r0/git/hypervisor/arch/=
arm64/setup.c:73: returning error -EIO
> FAILED
> JAILHOUSE_ENABLE: Input/output error

I=E2=80=99ve seen this error only when I enable jailhouse through some init=
 script during the boot process, when the system is also busy otherwise. Wh=
en starting jailhouse on an idle system I haven=E2=80=99t seen this.

Sometimes it may hang later during =E2=80=98jailhouse enable=E2=80=99:

> Initializing processors:
>  CPU 1... OK
>  CPU 0... OK
>  CPU 2... OK
>  CPU 3... OK
> Initializing unit: irqchip
> Using SDEI-based management interrupt
> Initializing unit: ARM SMMU v3
> Initializing unit: PVU IOMMU
> Initializing unit: PCI
> Adding virtual PCI device 00:00.0 to cell "root"
> Page pool usage after late setup: mem 67/992, remap 5/131072
> Activating hypervisor
> [    5.847540] The Jailhouse is opening.

Using a JTAG debugger I see that one or more cores are stuck in hypervisor/=
arch/arm-common/psci.c, line 105.

It may also succeed in stopping one or more CPUs and then hang (again with =
one or more cores stuck in psci.c, line 105):

> [    5.810220] The Jailhouse is opening.
> [    5.860054] CPU1: shutdown
> [    5.862677] psci: CPU1 killed.

Has anyone else observed this? Any ideas on what may cause this? My gut fee=
ling is that there=E2=80=99s a race condition somewhere, but it feels like =
looking for a needle in a haistack.

Finally, if =E2=80=98jailhouse enable=E2=80=99 succeeds, a subsequent =E2=
=80=98jailhouse disable=E2=80=99 followed by another =E2=80=98jailhouse ena=
ble=E2=80=99 always hangs the system (cores stuck in psci.c).

Otherwise, once =E2=80=98jailhouse enable=E2=80=99 succeeds the system is w=
orking fine and I can start, stop load and unload my guest inmate at will.

To make matters a bit more complicated: My system is based on Xilinx Petali=
nux 2018.2. For various reasons I=E2=80=99m stuck with the ATF version that=
 comes with Petalinux (https://github.com/Xilinx/arm-trusted-firmware/tree/=
xilinx-v2018.2), which is a bit dated. To get SDEI to work I had to backpor=
t a number of patches from later releases. I am quite confident that SDEI a=
nd EHF handling are now up-to-date with the master branch from Arms ATF rep=
ository, but there remains a chance that I missed something and the issues =
above result from something in ATF.

Kind regards,

Oliver

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/91E9F831-4F9A-4444-AD9A-3E5C56D3CA70%40gmx.de.
