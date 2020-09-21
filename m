Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBWWPUH5QKGQEV3JZGDY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc3b.google.com (mail-oo1-xc3b.google.com [IPv6:2607:f8b0:4864:20::c3b])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FAB271E43
	for <lists+jailhouse-dev@lfdr.de>; Mon, 21 Sep 2020 10:44:12 +0200 (CEST)
Received: by mail-oo1-xc3b.google.com with SMTP id a21sf6546649oos.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 21 Sep 2020 01:44:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600677851; cv=pass;
        d=google.com; s=arc-20160816;
        b=T21lRRv8wgklwNSd6FDNz84xMrnTi3m9TpF+Jjt/rWoTWXhWI1RcKgIBzdn/3G6duO
         ngM0wlZUVG/WQQhJTtEuOmcODwqtlhwUqSKIX0Dn8GoVFRN+DRhY0HA1Jp0jqCNIiQ+N
         CYlniGAZqeWMk07MFH8n86sLEzuWfWYmvkDwvqjZri4Hu5vH50gsGsP1Kg+HAj5fOM5Y
         g4r926djMVIysH2BPW6ppXLCeEJVMribG+imTJL+6EFdaC9ZpDw9SGgF6AapveUz7MHY
         ak2XyOIuzWQjjae2CUUL53tzMFVyIgNIZMPkJEbLl4Gb0Oc8urqYFkLl8E9Ty9MBax5H
         JPlQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-transfer-encoding
         :mime-version:subject:message-id:to:from:date:dkim-signature;
        bh=71D9VTOf9TPNdUVTIkDV/8URm1pq0pFEjhlV8LkgCds=;
        b=Cfa6MQa+Jra81yJabKwJtOh5baT6ez3PQHY0hwI4gOdwQoQ1Hk1vE+B1w2xA5T2fml
         JAP2l80y4nt9tl3NGzpZ24636D/n2z5khdwUMK2/tPZ3Pa0lm2QL9Uno8xrlFRZqKQ1J
         PJvzxSidAOL/uKg1rKgm5+DN8YrLOuiUrEMQU/soj0OnoQ1pQQW2ZrbZ/v4RnEIdmdjN
         cLqutEOLVSLfMfGvyAlY2QWKBqg/ngpqU7uImeGgHzKWYvoWpl+vteqpIuw1RF96nGan
         4rBHeJBvZ65sz0vbnWvNSXe9vlYAKuNl9hWTpJij58uatcMpjy7pwU5EKgdW9QT12tv7
         TM8A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="vh/SI/JQ";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.205 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=71D9VTOf9TPNdUVTIkDV/8URm1pq0pFEjhlV8LkgCds=;
        b=ezP0EL+2Dk70dFQerH5lQVLutb+KGzjL/Q2cXoRRZpfcgAJW9jmKbyUJcwnW9UJPZx
         wP7ySqW2MyGREQOXCnwhnJROnRmzyWsT+zM4PJi3mVpfUHydTFrlmg+nWkFQffPSe11/
         5qbAQHy2jyeY10St7V4F1zv7Si4dCA+VjhgDeruUrUMHDeu16Ua4UmAdk0URk+lfublx
         z+p9rot1QpW6ulfih+Kwnbmbq2To91wm5zoJfK6l1Ix93u0t70dKVSnwQiG+/vjYKNAl
         c288lOOiJZD3QheIWIDDjwRQZPw/xCQHRr5EO/n8EYPoeYJ9P+9G5bWr09JN0VDvYYVK
         EKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=71D9VTOf9TPNdUVTIkDV/8URm1pq0pFEjhlV8LkgCds=;
        b=m/A4QUI/UlfMktkPzwBKY/l36Fh8sj89UMFCIjs06RX/DtyuBzZD2Z5CHmJJ2+fznL
         He+TO9PFxbGu34KkiZFH9eFD/fadmC4SDCWpx2mKPHYh9UvbHptsJfMfnIceWgGJr5uk
         yamt7zOyYEfAnw1C7+JxWT6IXdVBB5ZLV9J+0b2Rq2BECultw3uGXRqsobG6KvXwX2fJ
         srV+F26iOTPAbuP6YwzpkuMc4FCfHZiravezoDc4M48Ok+2ZJL19MRaoOiQ0KMzfZm2q
         7+KEpXk+M7P+4J+3k8HFwmRxhYK46x1AqPWi/jQSekjwQbw+SYp60LJHPS96tBI++2cW
         gwCw==
X-Gm-Message-State: AOAM5318MW8mqDPY+qeaAwWFo5xigO0NEtD7P5RL0IlqWM/jQ6/20U3o
	gc9aIK/GQh1/q9PfbKk5/BQ=
X-Google-Smtp-Source: ABdhPJzAaKSAx0RxZQVGBh/rAjRH4M91Scryo446Fy9ZRZIw8zHtLrGBK85Kxcuzo2JLg7V0S3kn9Q==
X-Received: by 2002:a9d:2925:: with SMTP id d34mr30621603otb.140.1600677850963;
        Mon, 21 Sep 2020 01:44:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:49c9:: with SMTP id w192ls2773726oia.5.gmail; Mon, 21
 Sep 2020 01:44:10 -0700 (PDT)
X-Received: by 2002:a05:6808:6c8:: with SMTP id m8mr17535177oih.142.1600677850553;
        Mon, 21 Sep 2020 01:44:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600677850; cv=none;
        d=google.com; s=arc-20160816;
        b=KZ6dbnnhZbBtSxeWR2aRTEM/lMuRAa16WMWHTyDbcC1GB6wPY7wTSckJaMgMEKleBK
         Xi84xGtr6+S6L8Q1ec3D22H2Ygv7FPulb5B9+LW/f6jpoHRLTZtqM1iMuk+9Em9YULwu
         frDxqZPS4yVMA5XQ69WaK0ehrWPApRsnc4Jw/YGbSlQlD/c/SGIvpdIqQwI6QDk2dIN0
         EnRo1MkSa6K94Knb2hHPjIhhwL9FP5fT95i4tkfK4UIaDP3Pa4BvtNIm7utnajNHbihI
         KgPgJHkP1H6OvbFn4KN68BWoZcqq1S1NYYAC6pENOrrWAH9XMEIEbrnMD6dBOCAVbMfo
         9KNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=0Y8ZYe8/6XukPLbEtr+P+uZfqxwwLf108FeJPL7G568=;
        b=NtIROGJezP6xLDVj+QgdrtnXu4hz6K+1OfvifwZ9h1b3A1BixiI1uIGDx937XcBuVT
         kqWEmt8u5nZYDmlQEGHBZZAcnu8liMvzxY82IZnvcjvC35qoVJ82oKIRcRT+p37L/nN8
         hzcgD71JxZUkFpXUfocEVOrcATwV3prxs6+6a1siDlecnbgZZB4wM1gstVWu8MGPua9K
         GDIOCo30pSpUcamAVFNO66Wxj1ZeAbj80nM2aevhnOKovclWg9B6lTg4J+2XSLAUN0Ch
         Z6B+/kXSLzoofBrdn7FREpAPh4G2f/vNZy6HPjJyFq8iUi8eXcZVE7E0GkEb0RhXdd5s
         Gkww==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="vh/SI/JQ";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.205 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from out-22.smtp.github.com (out-22.smtp.github.com. [192.30.252.205])
        by gmr-mx.google.com with ESMTPS id 71si739293oie.0.2020.09.21.01.44.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Sep 2020 01:44:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.205 as permitted sender) client-ip=192.30.252.205;
Received: from github-lowworker-39ac79b.ac4-iad.github.net (github-lowworker-39ac79b.ac4-iad.github.net [10.52.18.15])
	by smtp.github.com (Postfix) with ESMTP id 289005608B5
	for <jailhouse-dev@googlegroups.com>; Mon, 21 Sep 2020 01:44:10 -0700 (PDT)
Date: Mon, 21 Sep 2020 01:44:10 -0700
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/90684e-881ff3@github.com>
Subject: [siemens/jailhouse] 01f2f4: arm/arm64: Factor out common hypercall
 stubs
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b="vh/SI/JQ";
       spf=pass (google.com: domain of noreply@github.com designates
 192.30.252.205 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
X-Original-From: Jan Kiszka <noreply@github.com>
Reply-To: Jan Kiszka <noreply@github.com>
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

  Branch: refs/heads/next

  Home:   https://github.com/siemens/jailhouse

  Commit: 01f2f493344b15ff046adeff88ce2eac0dcc1b6a

      https://github.com/siemens/jailhouse/commit/01f2f493344b15ff046adeff8=
8ce2eac0dcc1b6a

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-09-21 (Mon, 21 Sep 2020)



  Changed paths:

    M include/arch/arm-common/asm/jailhouse_hypercall.h

    M include/arch/arm/asm/jailhouse_hypercall.h

    M include/arch/arm64/asm/jailhouse_hypercall.h



  Log Message:

  -----------

  arm/arm64: Factor out common hypercall stubs



Just the argument types differ. Factoring that out allows to move all

stub definitions to the common header.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 881ff3a27244532c61b9dc7cbe2faad56d11a222

      https://github.com/siemens/jailhouse/commit/881ff3a27244532c61b9dc7cb=
e2faad56d11a222

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-09-21 (Mon, 21 Sep 2020)



  Changed paths:

    M hypervisor/arch/arm/mmu_hyp.c



  Log Message:

  -----------

  arm: Drop sp from clobber list



This gives



  warning: listing the stack pointer register =E2=80=98sp=E2=80=99 in a clo=
bber list is deprecated

  note: the value of the stack pointer after an =E2=80=98asm=E2=80=99 state=
ment must be the same as it was before the statement



with gcc 9. Obviously, this cannot be fulfilled in the given case as it

is one of the purposes of the assembly block. But as there is no code

after it anyway, it's safe to drop sp from the clobbering list.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





Compare: https://github.com/siemens/jailhouse/compare/90684e3e8551...881ff3=
a27244

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/siemens/jailhouse/push/refs/heads/next/90684e-881ff3%40github=
.com.
