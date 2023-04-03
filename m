Return-Path: <jailhouse-dev+bncBDRKPIXWWIFBBK4VVOQQMGQEKD5IBHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CAE6D44C3
	for <lists+jailhouse-dev@lfdr.de>; Mon,  3 Apr 2023 14:46:37 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id o17-20020a198c11000000b004e8706b0c72sf11659628lfd.21
        for <lists+jailhouse-dev@lfdr.de>; Mon, 03 Apr 2023 05:46:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1680525997; cv=pass;
        d=google.com; s=arc-20160816;
        b=M2lqX5EMDUdTglkhLj+i/RT5cKpOIkXwAq3N9VqrzPjdvymJaE279KTfzojVrbJUPp
         blctIAzRH/g6upAPSAapZpJ9bH6iUrFfcGJrUxh5uWLqQb2zgrWZmgF3yx/zUH4GMxnK
         JM65tj6DkKTqn2STHM378zHHxcN0WMSTrsJfKLezYZ491NOXPzMVDapCitIiQdGLPCxL
         1CQ0k0yRnkM7c31ZJaaF2zXJO5El7qTaafH2myyFk1geARgfdibznkimSpT7tXiuuFBl
         poNmLamTxlRUA60Wi81O0LspTpqg9kJU21A7gMoseiEQPnfkvPDrdEdgOladJrB2iiyr
         +EXA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:ui-outboundreport:to:date
         :message-id:subject:mime-version:content-transfer-encoding:from
         :sender:dkim-signature;
        bh=ywKP9feE1uejfOdn+h+sn+b65YAHwseI5u721dKvo2M=;
        b=oOJuyoATOZaa+eCYjjxKbYUKurjGHIBO1//XIxE+fChpb0qm8LBTkYmY2fOD+vCv1j
         XWHJWMcrgEU4G5iLORFd7D82jsFQ3FCE6OSfr2B2W8n2TMoWm1hTUEReSRksMWIDyYr9
         7RDvTfkQs9VDA53f3QWC+RVjuA882IIL5cdcrpjf5HVh3nolIJ422F6jHzcqrnhHhbjt
         voL6wGo+fqWQjAKenfy9XrLPOFrQFxgjiQswp3XUx8W43FI2zA8F37QtpBK/vIfMbL7X
         cHOwaiVvrNljAMie2PSt9sX9UjGIlv/aBr/enWyNFQbc4X0rVeyJ86Yu4kpuaUyzeo0o
         QoxQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=MymXSaad;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.18 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112; t=1680525997;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:ui-outboundreport:to:date:message-id:subject
         :mime-version:content-transfer-encoding:from:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ywKP9feE1uejfOdn+h+sn+b65YAHwseI5u721dKvo2M=;
        b=DGamU62/vo22Po9GAWydW/VibxV8PdmbZ/EF7Rh1vygvaDHkyU35cdgaNwTWleWmcp
         PDgwjSbSFT0shTb9Vi5HIHmlCl89d54Ww2ch0aqm1qienxMBpeWNWAutKYMHtfo40OGC
         pWeJl1wfl9FiwdlvNFc+PuazBnkfUCG4+RyLhayG0RuHHIwlchWiczuGNNaGhIrz63XN
         zmgZUKDMTIYTLuqWk8gdVBTyZlGetrT4rN6tZmzMVYL9TQQ7cmVmrzVBrLt5WuLF1oyn
         HWBvUzVfuqZTqYToYPGOKI91OfwOPtsLDO6wJfYwqfGlVDD568kHo4rz0nTnmG7W1pbT
         Y+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680525997;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :ui-outboundreport:to:date:message-id:subject:mime-version
         :content-transfer-encoding:from:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ywKP9feE1uejfOdn+h+sn+b65YAHwseI5u721dKvo2M=;
        b=FRbrFhq56BzTF/ZV3u9bqR8gZvF4xHPiaIQrOyY3sQVi5RNkhLBzJ0KnO8VTPHK0mr
         o5L0Qnr/FpfY/UgdwbuzerdWC3R7IqbXwcGKwbA21XKdqp5mwPVTQ1LelpW1YQ43uqtx
         PcDRzMa/7Z/XWpeGNbl1ycMOYw+mY8hDVsJEhmCfz+jGQIYBDT2deyIVF5JhTCxbRujS
         SQoF+iQ2z7cxeqbRzowlu1JdEW5eVpKKuy7aRok3wYRAFAQUeA4Nn3r/3aO8nABU50dc
         Ljd4GZvrh0PnGqvm/jqVGaaieFw7Ojw/753dF6MrkIVh7HuT+GE1m1gfHjqkeTVsy+23
         TL1g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AAQBX9ekPJTUdvV4DDj+zkdxHwANOiFWvIoDwedXGYalrEZDraZQLn2p
	OdZaXvI+Re1unbFgiJwEJmY=
X-Google-Smtp-Source: AKy350an0lVYbMvMz7Wq/gEyCNk9Hm+r4/DjxgykbCC+VWqL4oTviSWXDoyKJVR2McFtqxFm5iV55w==
X-Received: by 2002:ac2:554d:0:b0:4eb:3b84:d2a3 with SMTP id l13-20020ac2554d000000b004eb3b84d2a3mr1593247lfk.0.1680525996773;
        Mon, 03 Apr 2023 05:46:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b8d2:0:b0:295:a3ad:f338 with SMTP id s18-20020a2eb8d2000000b00295a3adf338ls1620184ljp.4.-pod-prod-gmail;
 Mon, 03 Apr 2023 05:46:34 -0700 (PDT)
X-Received: by 2002:a2e:a308:0:b0:29c:8a14:e3af with SMTP id l8-20020a2ea308000000b0029c8a14e3afmr6135406lje.53.1680525994236;
        Mon, 03 Apr 2023 05:46:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680525994; cv=none;
        d=google.com; s=arc-20160816;
        b=CsVktXQrWxrSi6egaGbOkZhhRVF3kVnB4qY2l6+iex9GgPIQZtXBcEe7MssmIAx8F8
         X30NtnmiHLCg3ptVRrHxytC1aqb6F893QlL6KzFwOUgyowuZS8n1gHa5LWK5uVyz0lzl
         J+M8rEoxBtYCG5dHNvCnkbU2nNxJe44uvxRweE1NNebS24OY85cBiR90jXsG8PWUdI10
         Rrz0ud5AH9oQ5kM/PEs76AcgXi0RekqsLYnEeUu0yb97dbLkaQzuZkH3uVtGh3MA6DHu
         Zl5z25UnYJ3h0GrSJTaV7k2ijysHU/LQ6hFRwG3PpsCPRK4SSf7PckDGqPzjKOaXOdjk
         6wGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=ui-outboundreport:to:date:message-id:subject:mime-version
         :content-transfer-encoding:from:dkim-signature;
        bh=oSEPk71o2T4NPEIVpVoOPW6HNOpC21H1jaRVnFx9ghE=;
        b=RZuZZcdJYYMNhb2sUwSpSCQ+0pZE9Uj2uY/VZ9Bqw+x6pKpBIANKwr5u6sIm8EmKqq
         2g++LF3zMjM6Oy3y3JY18iOu3g+6M5Ieti6u/cod11vl7WHnk8CPBKOsJGxyjxx58AMG
         9v/OihjR1RtK8UUrcMQgZs0i0XDG+ojU1dcZfpkvoGH3GBLt1Vs6P7efIMWxAv7JHgoQ
         8ypT5BagvdZ00eSPhOau/JnUMe8IiWBpJdCIYsi6u2GOv+WMf7Am73H2OpZoH+p6Crb8
         5YRPLL3brXa0GNox8BgoBMhaLVa55PxQHXcXYFvScdcmYGzInf60ny1nVBCdYjARtHRM
         Gwrg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=MymXSaad;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.18 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmx.de
Received: from mout.gmx.net (mout.gmx.net. [212.227.15.18])
        by gmr-mx.google.com with ESMTPS id y1-20020a05651c154100b002a61d615a07si491787ljp.3.2023.04.03.05.46.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 05:46:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.18 as permitted sender) client-ip=212.227.15.18;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from smtpclient.apple ([212.126.163.234]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MdNY2-1qINHV2Wjg-00ZN1d for
 <jailhouse-dev@googlegroups.com>; Mon, 03 Apr 2023 14:46:33 +0200
From: Oliver Schwartz <Oliver.Schwartz@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.2\))
Subject: Performance issues on Arm64
Message-Id: <8EB33626-D440-43B2-91AF-D1C06BD34770@gmx.de>
Date: Mon, 3 Apr 2023 14:46:33 +0200
To: jailhouse-dev@googlegroups.com
X-Mailer: Apple Mail (2.3696.120.41.1.2)
X-Provags-ID: V03:K1:F/gCtHRfbmATtmSbO9kgk2tFiuCm/vpPeH8J0lcbwdpwB2icpQN
 zyZibvOSt/tjBMTveWBFuoGmruR4CJm0Qn2Lm+K+f0uzgEvnN01Ey8zZYmEin/IorrD+cPq
 h4VLjlVE37nCbgmUH5htcisxCXYlkS/R2LZM9yEtPKVwP1i+RAfj8MPvnQTjSDMaj8GnzrR
 aS1s3szg4pwvtPMcl/Usw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:CI2SizT3EF0=;rlyQx2VF3JFzHKjx/ptuoLKopNM
 fcAyrNXxijaPZLGdpV1TNVGswq5Jaiec0zXDIXF0fNfbBcz26vWtFroDClnCB+oyu6Ey+oL7T
 YK15eMhm9suMJx2BNJe1N+4RdoKN0cNpVs7ChH5sEDlDaje+jXSds90pORFJj1pRy3eNGrp3I
 a9lxUnx5/Vqr/PmLiqCCGXekr2sdSGnAp9eUX8fIN4h48Kjgk1c0w5cU2oEeaKAhsILbs53fd
 pqyDkyUimu59nglEHDupnmc0QK99895Qr6DsMMEZFYSvKe3L3bYe4D4wxoUxoP4W/ZcVYhYxY
 QemqrkVAEXiygMA59kpNUZ7SqjyQdDVzjpAWcMptxtSNx1J3xuEPCWNE8p4k9usRDg+EXAHFW
 5B8OYAU9qGk8+FoRar4lruh0/VBFNRYDduTfW2m3tx6TqASKH87guJ6hbjyIAV1+/k1wwb6P1
 akyFg2cjcmMFy8qNDLJSMxDvJ/ImhMJgDTGUbxgTcjicFz3SLmrOv9sUqG9z/Y1A5EVe+N12e
 wy5m6Wx8n4HdC3D+th+Ec+bSFqsdHyGRwRj0H7puerhfaM2Rky7WfAE2gR2jMOrTTJXe4uQw6
 86NKlIV2VhFzURNotPH1TVqWKoO7LT4oQM79lTU4s2MosZyPUmgu/0OGLnNJ+5mmAdKcys2Me
 9OoTxua3C2YdRXqR3R73avY3be/8EAUCW9zpmRMQH4ptHnYZwKFat7FvQ3XKP1b5t8XikviDR
 DeuuTavtd9VHN13m9q7DJT8Z5/NTxmd9fhsmWi9hE2uSqS0GdQtf7cqeZ8XZiaNODbiVtRCqk
 v5qRJ14Joez2UZHmBctKpgm9mCSO590dBR1VWDDRAVA11Z7sygaQzXbp0UtvX+khQ7TRd1AdX
 pxeAjtYLvYiCrQ4lbhBmMRZmo7fKOf+iQtXZ2Ou62ZziEdm2J72TrGIZ4KtV+8jnLd4qAAuIl
 4dX8sA==
X-Original-Sender: oliver.schwartz@gmx.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmx.de header.s=s31663417 header.b=MymXSaad;       spf=pass
 (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.18 as
 permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=gmx.de
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

Dear all,

I=E2=80=99ve been hunting down some performance issues I had in jailhouse i=
nmates cells on Arm64 lately. The problem was that some operations driven b=
y interrupts in a baremetal inmate cell failed to meet the timing requireme=
nts depending on activity in the root cell.

I=E2=80=99ve finally figured out that the reason is the page table operatio=
ns in the Linux root cell. In arch/arm64/include/asm/tlbflush.h in the linu=
x kernel all page table invalidations are broadcasted to all other CPU core=
s. As far as I understand, this forces all CPU cores to flush and reload th=
eir pagetables, regardless of whether they are running in the same cell or =
not. In my case, this has caused interrupt latencies to increase from under=
 1 =C2=B5s to above 20 =C2=B5s in the inmate if a Linux application did som=
e heavy memory (de-)allocation.

Apparently this has been addressed on LKML before, but the proposed patch w=
as rejected: https://lore.kernel.org/linux-arm-kernel/20191101172851.GC3983=
@willie-the-truck/T/

Since I only use a single core for Linux I can workaround this issue with l=
ocal updates to the page table. However, I was wondering if there is a way =
to address this in the hypervisor?

Kind regards,

Oliver

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/8EB33626-D440-43B2-91AF-D1C06BD34770%40gmx.de.
