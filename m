Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQUCXDVQKGQET7JVKFQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id BC449A60F2
	for <lists+jailhouse-dev@lfdr.de>; Tue,  3 Sep 2019 07:59:30 +0200 (CEST)
Received: by mail-wm1-x33c.google.com with SMTP id c6sf3063118wmc.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 02 Sep 2019 22:59:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567490370; cv=pass;
        d=google.com; s=arc-20160816;
        b=sAtKO4clQlHUUTh8YpJ1KP1z8exlPaVNUoVvaq/WDAPuueHsv3by/NSqXLjwUPiPUW
         NPSGdnfCZEFl2iS2YSN4LAv3DBIJl0kn9gXpyvacVdrdlhjdyaGfH10z6r37miOIeZZ8
         FmwohyDZlOjLRH4ZdO1+xmQKb9yQy5PedJ8LEsHPxZXa1YB3UZyb9LJdnJQ/DaPzkDkq
         UgSjMLPTKnQ/r7w0/ifdmM0HqiTNXk8MNvLd9hgsYL/77mf1eOBZMC7Syg0TF+LLPgI3
         ffNZt74WmqOwcnEzUyk2JvwD4E17SQbKu8XkMJZep8so6AgXyF6cF7T+IWrmLwaKtdeD
         ksYA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=RiG6UBbhbMmsgKrzfZVdmiH2BqbdNCIg/uuHns7ZLJc=;
        b=gXZgbkxC7uRwtiANrCFOnAtpLP1j9amw3jFS8E45UAFx54jqMg3/s59hTVchcsc1rQ
         r2Xe0PtZTWl5FSpyqEMJNiyRgkZaZiyWe/UGQJBhlqxywVNAD3dXADMYNBbTX5CxUr4O
         X2PfGw3EhJdl2+DEjnExL9su/GXuptl3HfTW1FEFDiUoNUZwMjhdny2jYJOtw5DKGfhR
         WrUGnMELNzdLY5aPfHz0DlWDROaLrjNCNVEWtySeQty2y9BKCZvNZvp5SGdBsLLr2OTz
         3C+fLImL1cgyoBIQTNd+toIVMhtxwQZTLigi9rGOxitwFRe3c4Kods/0MFCDQTOQxjyK
         IrOA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=RiG6UBbhbMmsgKrzfZVdmiH2BqbdNCIg/uuHns7ZLJc=;
        b=c+/5cJ/HLWp5eeOhQqn8vgtyhfTE0VX94sf/dR0t3kQ/1GWztdLrOsxtja4U9E7GU2
         dUYefleATcyajXqeA5VWbwt+S4gBGR9GDU+OtAiSIXixFd+S3i+obHtKOVee/sIwNnqh
         NW5JpphO3GyRDui5pUTQbdG8Ko7s/+GVx3oR0A5ItYlyA5KwhN4uquSgqYr1dGe68EF+
         6lVkqJWqNjAZf07NR1lszMwAJja/A1vBfq7I/8ALdfwRUEch8Hp1B5QrlOHfDxaV/lXJ
         xHEMpBzzEO20fcWdkjWdJMUptfHAxqOSzdHZvS57NvL0av7b+lRXmYIl/3MNym5EBmpg
         dDkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=RiG6UBbhbMmsgKrzfZVdmiH2BqbdNCIg/uuHns7ZLJc=;
        b=o0q2M7jx0GZpufHnf9Zy8O4e/iY0sGK2Q7t7aT/ErXKuCmNiCgUowexuOWyBZ5Qq4/
         h3pdh8uZoSBwU4NhCaHOXexzBlboSiW/QRx9sCXaTWIbCSAeMLWJG5uPewBTfc4YFaG0
         dEkvHeZrdUByfmgJiQ9Iqab3bdT5cL4BKWs5DdXKij3qbogHJDxurPRWjjNPNG13eEhH
         w1X79EP+4v4RGUfBtSv582CYgx+RWT7t82UMc9bovkq5mos5DdNxMc9qo/IbFZZ59eqL
         jIJ394t7Ktd1juRvcdtRY+mF7vWuEc68U6HCqtUAdsFxnnDchvN4/B5WEPs/W53h/aBP
         1zKw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUyfwQRBycWRM9IzJ6WQ8CPEPCE9ekjpg7rtIOX4cXqbha6ww2A
	aG3b+thx8kuJshUPL/hi3Ls=
X-Google-Smtp-Source: APXvYqxxKzt6xBYaTlowq9tvj0pl/nKiF0JWh41M2EGsDegZfaqjAIZUzQVipReC9FEfPTy4j4kpjw==
X-Received: by 2002:a5d:66c5:: with SMTP id k5mr42078012wrw.304.1567490370501;
        Mon, 02 Sep 2019 22:59:30 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:6c06:: with SMTP id h6ls5052930wmc.3.gmail; Mon, 02 Sep
 2019 22:59:29 -0700 (PDT)
X-Received: by 2002:a1c:7009:: with SMTP id l9mr40191467wmc.159.1567490369854;
        Mon, 02 Sep 2019 22:59:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567490369; cv=none;
        d=google.com; s=arc-20160816;
        b=FHu678uF9Y2wDKqDzo2DJrnvYxwe+9jfGi+sElSlyBVXBt0wFeON5MBdHHeG2sx7KS
         Z0xzcIiifUHW4xJLLbW2UNYtJTs/AEuZotAk3HvCsBJKGbCwaTY2nlC8DdrnabruarI+
         aHMDNAjiWBnYdLpMM8v7uoMkZVCRoaYnh7wscoRdcb0KR4XbqdH8GrUqZTkzgsYfv/ti
         TT8eUyaCVfq+9AmcesOPghiXEmlIkpFLlzIzUVuTfm+XKOruRKL3IYkF/vseoFBt1Nge
         FF74RUizb9VbxyFYPZeRd0Zr8se4CPtpn3rhbJPpKegVDhgscVhZSat0v3n62n3ohhHs
         TN6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=tHMELnNY5wtELXiHZntkf44cLTFFBKaaPAbt+PjT/s4=;
        b=Zlc3ndHTI2GK5FfxSXnOc36vP1QxsFKzYw4bXzaJ4qnEvlQSE3/tl6XKmsOO3wzoQM
         Tdwb5G2CE4foi2c2K9+eI6FOTlgkeuuocVGMdwde644OtntVG/RBl9IzXzX98iUiKxVU
         xrGuDnRgVQhYaF57UljYlU6JQ79UFpvy1uhBbr28bPFAtFN9YoIiZJAE9ewKCojN/ZQP
         ILsnvYua9NB4P0orZpFffkhjGiWiOukThjtd6AfvahjDV+ZhiilLwkuzpxBXep+qvN8q
         oJbRz79D9zo4HY1WXaF43wpF7aUh1cftlMUYlxpKP9lZ32cAMB6lcNwO7k+iYaC8nSr+
         ULmw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id a198si1063219wma.4.2019.09.02.22.59.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Sep 2019 22:59:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x835xTES012547
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 3 Sep 2019 07:59:29 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.40.78])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x835xPkY010486
	for <jailhouse-dev@googlegroups.com>; Tue, 3 Sep 2019 07:59:29 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 11/13] demo-image: Add dbus package
Date: Tue,  3 Sep 2019 07:59:23 +0200
Message-Id: <29dfbcf9ce31e7d3992128fcbcd3f48b0aa1976c.1567490365.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1567490365.git.jan.kiszka@siemens.com>
References: <cover.1567490365.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1567490365.git.jan.kiszka@siemens.com>
References: <cover.1567490365.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

From: Jan Kiszka <jan.kiszka@siemens.com>

WPA supplicant is looking for this. It worked nevertheless but gave an
ugly error during boot.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 recipes-core/images/demo-image.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/images/demo-image.bb b/recipes-core/images/demo-image.bb
index 2cd09e0..446f103 100644
--- a/recipes-core/images/demo-image.bb
+++ b/recipes-core/images/demo-image.bb
@@ -17,7 +17,7 @@ DESCRIPTION = "Jailhouse demo image (${MACHINE})"
 IMAGE_PREINSTALL += " \
     bash-completion less vim nano man \
     ifupdown isc-dhcp-client net-tools iputils-ping ssh \
-    iw wireless-tools wpasupplicant \
+    iw wireless-tools wpasupplicant dbus \
     pciutils usbutils ethtool iperf3"
 
 IMAGE_INSTALL += "jailhouse-${KERNEL_NAME}"
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/29dfbcf9ce31e7d3992128fcbcd3f48b0aa1976c.1567490365.git.jan.kiszka%40siemens.com.
