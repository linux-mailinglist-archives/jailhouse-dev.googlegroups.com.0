Return-Path: <jailhouse-dev+bncBCZKXDNMZALBBXNIY7WQKGQE4C7BKGQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 7479CE3863
	for <lists+jailhouse-dev@lfdr.de>; Thu, 24 Oct 2019 18:42:06 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id u14sf5301053lfi.10
        for <lists+jailhouse-dev@lfdr.de>; Thu, 24 Oct 2019 09:42:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571935326; cv=pass;
        d=google.com; s=arc-20160816;
        b=q6ts4uU8Wep3BhhrGWdsiWnr/GVoIouUr9scJ/jz3Qrzlg2MALL59bNSvp84+lxFew
         ziVlzx7HtQRF14d+Vn5SzFFEydv80RaRxRs9KJqBPcRjb0U9o/hnpcQGCzy4qKu2XbUb
         2zvgpZt16yyvX4KiN4qUAC//3hZjswp2S8YjiIp+35Hmkgd12SW9Ty8OocgHZ/Nqkyxx
         beS2vkQPHffovuY4SFW4zch8hkX4KFa0c+tPkOtPuhxeSLoMOEJka5itd/aL0jdeDQLB
         BchrV8SlLGSinDvHGABmthFoIUHHQdrn9OG644SrB3wC6fh+1d0ovD2i6Z/sJBnCwdkZ
         uzpA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:date:subject:cc:to:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=WaTfikNYmG5FRTljbpBZD96on8xHfQWmaTEmx0lmACA=;
        b=iM9s1v2Xv7JmSSLiw5JyUr0OORTUD4Y9pjCbC2swf+XEhTw0icjF+62K/7Yn9/HJG2
         MX7RL4xVXMtxY9mpxk58cPq5Q4wckFeRyxOTmELAnP9rkVojlu8fjmuLpHj0NAVpiDSW
         +NensWcGMY31rIK2zDu6Q7AMnC8NhrbsfS71YtNBv5K+RD8ymWs7eZNM7jX8r8wHbUgA
         DxFE3UKFRaj3h/5mNU4eV4Ry2cHkw9yhzUU4PBAhev+OkrtL5tfTg/mU7DKb0sjXpJ/3
         OYJPJSDyV1VDlAQW1a6YJKPm3nuDg3tQBzfo73FmeC6EIJuzG28RyBf0IZcXQO4yh/Bk
         evhA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=QRLjlDpv;
       spf=pass (google.com: domain of alexlargacha@gmail.com designates 2a00:1450:4864:20::336 as permitted sender) smtp.mailfrom=alexlargacha@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WaTfikNYmG5FRTljbpBZD96on8xHfQWmaTEmx0lmACA=;
        b=DAIsoYXI9LA5E6eYsaBDZabwl4JS+0rpqurnxizsVgVgO/nmqC8qvhKNGnQYXGwmHn
         kGwlMNbpEEmIop4waKS5lWUDUq7p9udQ0J9irb51MIDqqX2zryV6onHp8bdhl2TBYQ/R
         Sn1jzZaFnGvvbR9bc+F1KXkX6AATfTuvAM8lHw6px1CBXhWMc+u5CebTq8D13Xz52cVO
         ubyWrAMHhVAhorLkzKNGf8Gp+hPISRgx/jjEYR/D6LlrjAM0/btMPFibCDM3ZjpkdRFC
         tGtpx7q4SatVwM4UQQvW2iqAu60rO/wzFcZcVe24MbPTAVRHmecGlmG6C4K0GE8nMPW2
         dhRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:to:cc:subject:date:message-id:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=WaTfikNYmG5FRTljbpBZD96on8xHfQWmaTEmx0lmACA=;
        b=IekYAYbJnb7tNTlGQSZ+HkSiVk8vSVC/+nKRKV7shnA1F4/ei6va8i56akyq6C/K/N
         eEQ2yQIHmdsqtIqQAE5xKXJDvBMuPddpdWeBWQJChIhd1dVzonNZm3dcD2WfI/Xh8fMI
         qXNsUfpqte9HhIP57yxRIOTx5xQ3dKOjG/3p9pqOiCM6x4VPc+IIjvUceY6i0aUkX+Un
         XqqJYoRA/+9CV5od22wAmA+EtqSoVysTWPGj8oAkmR9E8Okk3rgtxrCKxm1bQi7mBB+U
         xTxin8qjGFSAeQ1VhmG2cf01bxqeLzWybGw1BGVHDtLyAVgCkBqdZWuvaNOIOOy6jdRC
         oWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=WaTfikNYmG5FRTljbpBZD96on8xHfQWmaTEmx0lmACA=;
        b=EYpXvCkF8R9IBgRoyCAU8JYNhAHctJz8c2nk5mDTq1bus3y3rZ4Xd8u1qg5937Uqru
         6+1qBRmaiD3sZLc5CCpXtDfKiA7kIBUI4/MI6fxZwME4mTN80Z27yJaBuJp1eF8G09mw
         P0/FAEd22TK79i9s3aj7bduVNA9rEIo1NjmYKUed5qrW/asYovKsVCNlMR6U0dJTrSBb
         7eNc9svuZqhMPGXtJOyDJjLOfvm5RLAE3TObPaJDKodkR2CIe1yReg6zQmZvu04cMu4g
         xoUhC3qd3t17/GfJ0L0ltAth2irUQHKyn4LGHFbcnBlkmK5AxpfZ+l4cVas2nNZG9SKe
         zbeA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX6/ffQeW8pyHoaESCItn4ZJe+I+mPXjWOKbU24YeQujcyvTeT9
	jLPFQoLr2o7jOxu5HB2rKXk=
X-Google-Smtp-Source: APXvYqz7x0TwE8D+/rcWeiZntImv7DyeaTTe+ko09Yp0FXU2wy4AFcLQ1dmPHEQL6vFCf4hwtWaSzg==
X-Received: by 2002:a19:ac46:: with SMTP id r6mr27140888lfc.127.1571935326075;
        Thu, 24 Oct 2019 09:42:06 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:4b4d:: with SMTP id y74ls647315lfa.0.gmail; Thu, 24 Oct
 2019 09:42:05 -0700 (PDT)
X-Received: by 2002:ac2:4142:: with SMTP id c2mr4543071lfi.47.1571935325099;
        Thu, 24 Oct 2019 09:42:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571935325; cv=none;
        d=google.com; s=arc-20160816;
        b=FEAodSHbwhsIZKImKPHQcX0lQs+H3DZllpn1VfifQwLiIYiLcYNByld73Vs6nib5wS
         oK3PcOCNvaiC44WTLy1zaXXoOJWykXBfGD+/nmKAfpOWQwaX/2sP6m2EEYT3GH8oM1c4
         FmVLeCGeT1SzpHztfzOo7q3eY5AIz7HzKEgYrhZe8n5yp0OncArRYfvc6OGCKAYfQKGe
         1Y5WxzvOZff7VtY23f4QSkEXoMa3XAzOiuIUXpWjeXZ0lbS8OwXkEl4llE9EieAvJ3We
         aWNMRkhZ79fQn0StbrqbqR2oJZgNCYFhOqieeUtz3VxmMSm1+x9BqkB0abpUvSaOY6jB
         3BsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:cc:to:from:dkim-signature;
        bh=zETjPbibvNhWHaONkSq/s0gimXMTq6kjeuxFrHfspSQ=;
        b=x97C88uOaeeTjWEIbWg9HzRS8902VfAgBOmpCEWq8Exz4I4Wbq1iY4mgkYafoba6QF
         UpI8YmOstmYdd4JZBwKl4MRqny9ngWdq5Q9EvNsYTbGH0IeasobmKduf7VOT5aGmWxki
         0zYqgO2L3UeeJRxewiA3FZpLd5gsbyPNqniR4Hm1Oi88cbzDOmjhZ2ca2mnKdmXc50DX
         1vInCUwO+g+AWzYt2UEkryQqQPwC8Ib9PYnd47IMZ5zXDdoNXE7aQk93dLjlK3FMnJoH
         8F5nDmCR5d9RGYNELOcRmBmgUh613HevIQvEl63KFWskveFy592u6pHnsN89O2+Y1WwC
         MGCQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=QRLjlDpv;
       spf=pass (google.com: domain of alexlargacha@gmail.com designates 2a00:1450:4864:20::336 as permitted sender) smtp.mailfrom=alexlargacha@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com. [2a00:1450:4864:20::336])
        by gmr-mx.google.com with ESMTPS id k24si1185977lji.3.2019.10.24.09.42.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2019 09:42:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of alexlargacha@gmail.com designates 2a00:1450:4864:20::336 as permitted sender) client-ip=2a00:1450:4864:20::336;
Received: by mail-wm1-x336.google.com with SMTP id g24so3580093wmh.5
        for <jailhouse-dev@googlegroups.com>; Thu, 24 Oct 2019 09:42:05 -0700 (PDT)
X-Received: by 2002:a7b:c444:: with SMTP id l4mr5625789wmi.21.1571935324569;
        Thu, 24 Oct 2019 09:42:04 -0700 (PDT)
Received: from localhost.localdomain (27.red-79-152-66.dynamicip.rima-tde.net. [79.152.66.27])
        by smtp.googlemail.com with ESMTPSA id 26sm3341383wmi.17.2019.10.24.09.42.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 24 Oct 2019 09:42:03 -0700 (PDT)
From: Alex Largacha <alexlargacha@gmail.com>
To: jailhouse-dev@googlegroups.com
Cc: Alex Largacha <alexlargacha@gmail.com>
Subject: [PATCH 0/3] add support for UltraZed SOM + UltraZed-EG IO Carrier Card
Date: Thu, 24 Oct 2019 18:41:55 +0200
Message-Id: <1571935318-25453-1-git-send-email-alexlargacha@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Original-Sender: alexlargacha@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=QRLjlDpv;       spf=pass
 (google.com: domain of alexlargacha@gmail.com designates 2a00:1450:4864:20::336
 as permitted sender) smtp.mailfrom=alexlargacha@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Content-Type: text/plain; charset="UTF-8"
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

This patch series adds support for UltraZed SOM + UltraZed SOM + UltraZed-EG IO Carrier Card
It adds also a demo to measure the lattency of a PL generated interrupt in a baremetal inmate

Alex Largacha (3):
  configs: arm64: add config files for UltraZed SOM + UltraZed carrier
    IOCC
  inmates: demos: add PL irq lattency measurement test for baremetal
    inmate
  Documentation: brief explanation of board and software setup for
    jailhouse in UltraZed

 Documentation/setup-on-zynqmp-ultrazed3eg.md | 128 ++++++++++++++++++++
 configs/arm64/ultrazed3eg-iocc-pl-gic-demo.c | 120 +++++++++++++++++++
 configs/arm64/ultrazed3eg-iocc.c             | 154 ++++++++++++++++++++++++
 inmates/demos/arm/pl-irq-demo.c              | 170 +++++++++++++++++++++++++++
 inmates/demos/arm64/Makefile                 |   3 +-
 5 files changed, 574 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/setup-on-zynqmp-ultrazed3eg.md
 create mode 100644 configs/arm64/ultrazed3eg-iocc-pl-gic-demo.c
 create mode 100644 configs/arm64/ultrazed3eg-iocc.c
 create mode 100644 inmates/demos/arm/pl-irq-demo.c

-- 
2.7.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1571935318-25453-1-git-send-email-alexlargacha%40gmail.com.
