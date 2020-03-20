Return-Path: <jailhouse-dev+bncBDRK7WUAV4ARBFGI2LZQKGQEZFN2T7Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb50.google.com (mail-yb1-xb50.google.com [IPv6:2607:f8b0:4864:20::b50])
	by mail.lfdr.de (Postfix) with ESMTPS id 3060918CC40
	for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Mar 2020 12:08:06 +0100 (CET)
Received: by mail-yb1-xb50.google.com with SMTP id l2sf4205833ybt.15
        for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Mar 2020 04:08:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1584702485; cv=pass;
        d=google.com; s=arc-20160816;
        b=n/JtNVuJ9I9Ink8MlbalIcrFAWbhNy1nTnuTbNQE6oZrWFu1lvW+XuPWmEEeW9GQ45
         6/R5Xaf2MzVL31wYdgf8/WWjsV/R/By+vRQRad0KMIE2BulQ9ipkYMWRr3CIJ6pwUBuH
         /YtuP5ih0bVNBlrJ6joifcr1tDc7PYz+pJiTjHi9mtdGlKvQlbRVLh5kYGriJxiJRD+g
         w9C27qorjKB4ZICNsk+h2jNjwDcPATkVHbSV1Hkb2943hM8oKyJJYQIdgKb1m+yngxBx
         5FshbHQLTYCcQTMQUdkg6jcfmp7KgkGTpGtGJm3MnNAzIsmLU4P5MjxC7Q0o2Et03RkF
         j6mg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=cqmp07MlRLTpE9bfx94I7mqGPWPaCZzr6C/i0Jeo5yE=;
        b=I5e5epnzZrJfY+IpoEIS/YpWEbZJ0yqUVhbKhi1ecRQ3m7rzc1YSO6pmCCz3VIP5w9
         jK+/i07IXRta9NtotIllP/I2lGBchibTqqXNepWJD0YmauUXGjaDI84x/Y7jB8s7fF4L
         37nCj9Vh1xG1iFBwwn1///ookzM67Gj9vkaDCwjmtig8ou/fkibV+Ih3k+r4MKlA0Fpm
         8PNTmqZlSLRrmcvSRbyKQ/KyGeuWRgoLVNEKjaMA90NMTfOTagyyUwZGyhGCg4VEoW+Y
         6UffIxxwi4anyJytBi+0JRnzOBSHP5L2OcoNFNvwmmuA6vXj/vrILk6Unwv8LHaihZuv
         DR1A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Kcjom3Ny;
       spf=pass (google.com: domain of federabureauofinteligence@gmail.com designates 2607:f8b0:4864:20::243 as permitted sender) smtp.mailfrom=federabureauofinteligence@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cqmp07MlRLTpE9bfx94I7mqGPWPaCZzr6C/i0Jeo5yE=;
        b=ZHZ1oeC7f4CsWJyBoHODFe4Ek33bqFP6QfDlVqTeU4i7MCVlAPOgtnT8V/H/7CKJBY
         FwmguPKUpspwI3wzr68xhgiRDIoCAJ39ZKuW1bNpdJ6BUWWs6vyAdCfq+PGvrKEnjWG+
         EfiLfxf9rzN3fw0KEEgABXYnmELTKYRmu6GlQaXwKsE5yex/yHRHg4h79RUdGTWp+n06
         4kWGfNflxgzoB52Tk3KbLl3hM5brUGqtXpBnkPWVjKIsCz8H2soilhi16buPuC3LxEjC
         4pnDQSJ5BJjxLC8gdneOQ/JcoFkRWOLWmJC8BanxM24MGHNtpvqdxKbuPLt1V3aYNyVv
         0WyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=cqmp07MlRLTpE9bfx94I7mqGPWPaCZzr6C/i0Jeo5yE=;
        b=iWZZAhJvcqlT1BzffP7QrkgDupHgNhkggGDGOI6iYXrYjtJfQwdbSws+Xh0bgAROBu
         nIq6UfjQC8xdCiqhFnoID5AEOPVQ3jwz8vZlPrM2FnA4wB/3chgUEOrsvLnFbtxmdKjS
         2LSzQS/FZYghGeSbwJ0QqlZiMJmqlz9SESJBV3dzx5o8sN2aJIga47VxIx+3IKTJOv64
         rlKaGhCx+RMZZvIRMTI61OfXqDHUdpaprTmxlAAcIST1oti3S058apgUxIQ4eyV5cAvm
         40bXO8Ef8mm8C8lmnBrdR8ExViPf6SKDGLhJ7fBGLYIbUUXa3mS+JDN+NpD6zmk7XC0z
         EMaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=cqmp07MlRLTpE9bfx94I7mqGPWPaCZzr6C/i0Jeo5yE=;
        b=KBYVJDLNkRq8bPkM6gvbvcKukV9SzTrcmuU7gMLAOkEEjugeAaERnlv3629di2XA14
         t/55GpxD9sO/031ildV2TuWWBYmX2CBv37WcvbV4NKYgB1A/72cuygNfUTeeB2z42z5K
         Qn0vlEUy28E0TYxUVNc/KA8/SIYPglR6PmXBny9h4Ol56kQgrldFhvimkLMcgmRH8HXu
         XGEntJl8Ja2HX5pAFY01GShZrdIybHzINLQaST7zUsqqXZ17Ryam4peLDxhHI6gnGTqN
         DMFF5V7dg3jCGkGF3bAM40rJdaKFY7VkI1BG8ZR0DtUYC/k676jW0tzcbXBEDUAljwRo
         dAcg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ2ZcmiXFZEYDNnBjJNphyk+9uYFTdsKrWLaaFa1PdOnsjFn3OH6
	k7tm8Jxc6KmhYmABPfLR1io=
X-Google-Smtp-Source: ADFU+vtJPV8ZqUT7vANHkXDVGZkpg9y0Oe9OhXHnJovkx3A8LVEf9CvHrmMzW6XA60qDFhd3Ym604w==
X-Received: by 2002:a25:1fc1:: with SMTP id f184mr11991030ybf.122.1584702484844;
        Fri, 20 Mar 2020 04:08:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:84d2:: with SMTP id x18ls2064334ybm.7.gmail; Fri, 20 Mar
 2020 04:08:04 -0700 (PDT)
X-Received: by 2002:a25:e90b:: with SMTP id n11mr12268509ybd.173.1584702484385;
        Fri, 20 Mar 2020 04:08:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584702484; cv=none;
        d=google.com; s=arc-20160816;
        b=G25BPKPK36G/x9difRoVfw6slqcCzmv8QF7sCWsp7bgPL8rOVpl3chYSVttze9F8NG
         Vs1P+IZ0wOIcu2MlDrKnTaOFZtxJIN4P8LvzEEIhRdBS3zKWgQnsU9Ds5QqBhopoFUAk
         Ur9qtqLJvK15QrrCciVY9Tgbw6/na3ltj+5Xuvcyb9yacX84X9WQFevkBodwMoWH5Fmv
         VFmdodLIMbPMdMZmmoGEKuh8fSn6P2RdSFz6lX2M8Zm0wY5VUq1IZqLgt0T/WPL8FlU8
         eGN4bop21CJpLAUzH2b+bXgNTfokNSA6F1lV0pjacq2P1Ys2rTjZDNFpvjoGb3czhLCC
         cGvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=kuhba0bbR9oJup1oQ7P5tNPZ9FqBHXE57QqcfHgaIHo=;
        b=H1XEJA4o9EpiAerN1bjbsI6Wj3Cb8zGsqQR+KVj+3qmsfcBfh0iP98OrFSP4MmINgS
         am+RWknVTNQH/N5jDZ+fAz/clNGLnrC1SIcrjG07ArY1pZRbQ4NhJLgzp8aDQYKS6eHB
         Vi4Git2asbxWJIMA1s4Vu+PvuP5fBVaUuayTDwslO0MFconi5zCtxa86uokiyX13cbuk
         bnWw5LFc/Qg4JRMw4uwgEq1+xDWlqckqMGAyZLgLBgVfksz172q6AHsMFNnsLHIzcbkT
         z7IyRdp+R1uFcgXxHu9Ew3ieQz7ZJHkOgSLMiF6yu6loFpHRFo9tEf9bsQUUywS4bvVQ
         XuRw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Kcjom3Ny;
       spf=pass (google.com: domain of federabureauofinteligence@gmail.com designates 2607:f8b0:4864:20::243 as permitted sender) smtp.mailfrom=federabureauofinteligence@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com. [2607:f8b0:4864:20::243])
        by gmr-mx.google.com with ESMTPS id l1si234802ybt.2.2020.03.20.04.08.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2020 04:08:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of federabureauofinteligence@gmail.com designates 2607:f8b0:4864:20::243 as permitted sender) client-ip=2607:f8b0:4864:20::243;
Received: by mail-oi1-x243.google.com with SMTP id p125so6018201oif.10
        for <jailhouse-dev@googlegroups.com>; Fri, 20 Mar 2020 04:08:04 -0700 (PDT)
X-Received: by 2002:aca:3255:: with SMTP id y82mr6102866oiy.44.1584702483981;
 Fri, 20 Mar 2020 04:08:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:c897:0:0:0:0:0 with HTTP; Fri, 20 Mar 2020 04:08:03
 -0700 (PDT)
From: federa bureau of inteligence <federabureauofinteligence@gmail.com>
Date: Fri, 20 Mar 2020 11:08:03 +0000
Message-ID: <CAE9o6LB50YPWezLwrs9uSwCgfuFuUSrTfGz=QiaO9Pj23qjovw@mail.gmail.com>
Subject: HAPPY SURVIVAL OF CORONAVIRUS
To: undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: federabureauofinteligence@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=Kcjom3Ny;       spf=pass
 (google.com: domain of federabureauofinteligence@gmail.com designates
 2607:f8b0:4864:20::243 as permitted sender) smtp.mailfrom=federabureauofinteligence@gmail.com;
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

Dear Sir,

HAPPY SURVIVAL OF CORONAVIRUS

We are reaching for a very interesting business transaction which we
feel will of great benefit.We the FBI unit in the western subregion of
Africa have a fund which we confiscated and lodge it in a bank

This fund is worth of $12.5 million dollars.We will need your
assistance to recieve this fund into your account for investment in
your country.

We will need your urgent response for details

Inspector Greg Adams,
For and on behalf of Cote D'Ivoire FBI
Tel 00225 6716 6756

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAE9o6LB50YPWezLwrs9uSwCgfuFuUSrTfGz%3DQiaO9Pj23qjovw%40mail.gmail.com.
