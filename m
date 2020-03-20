Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBRFU2HZQKGQEQRXZAMQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id D63B618C73E
	for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Mar 2020 06:53:08 +0100 (CET)
Received: by mail-wm1-x33e.google.com with SMTP id m4sf1722593wme.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 19 Mar 2020 22:53:08 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1584683588; cv=pass;
        d=google.com; s=arc-20160816;
        b=JrvBdTm1PKEFjk4sHIkcPcrKFY/gA5O4EuZOKlJYmBTjnygQuvMZxRja0CBZI6H35i
         2MvFxXh/PI+N0nFhLmG+Dp2udTN1616aVbU4z8+V6QzZE+huWGySSPUaeJtlD4m6ZpPQ
         D5L/qGXsn4tzqNSwSUXyNUmJgebrTzFtXJuEm6YdPPSN2ke/xM1hOFJDjGcvnJPWXhZe
         Hhhmi/OVfSIWnOttJpNE257r+JXw+41aD80eJ31wY2u9D/+j1JhwDS21qbwLtTgVb+pA
         b+PFFBiylyiLCMbtxbwse/x92b6oNAoqMPA7Y+epWWV95oQ8EfMkj1xuI61DAQrvE5Gs
         0sYg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:cc:to:subject:from:sender:dkim-signature;
        bh=5tlCrbD8mv1LWxZgejXr6HvW6nzQu1wKhUMcdL1o3Jw=;
        b=KoUflnDmmN8A90zjUUZFwPiKptbLGje2S4Cm6vV/iVZ4nTgjJtwTXOwCQEpVqjcoW1
         1X4H+BhSpDeqmYuqxB7Nb0GOJoIahB0GEX5iyKgtdctSbJxHzWSGEgtljwrnEzMt6G1r
         atmFtOhXDiXSZhodG/RV01N3YM5ZDcZfas4wcb+Gu3Ui5jrmltNsCmawrjEYLDwJzhq0
         qXT8eRzUzjLBnEUteoazXPQr958/ngMRtZlOQ1K7dYN133NC/Dcqj7+Yls8PXb7RjxAt
         YYt6v+6a5OlbgW8NGY8B0Nn/5sZ+eTKQxbfRAPBhlQdNJfk71/vYD23sX0uNfBQVQn0f
         hIYg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5tlCrbD8mv1LWxZgejXr6HvW6nzQu1wKhUMcdL1o3Jw=;
        b=Rg+452UraGMBogrupepzVLL6nPvI3PNcw3ReR1+EiQUm7XDPwfa2KsZoDqmTZDWVGw
         8X56QuqQyVltyky8ZJybzre7gaMqugur0C+2KxeYCbJy6RmDa4xEq0e4lVxU5657KFat
         dvC2Gx+lOMCm7sTHVVGgw52zVAgVL1KiJxoIs4KZsQw+RBM7TiB8yyS8oQotsfsj42+y
         YFeqHppR+wCHfrKVI1fRfEZttEHvGAzE9UqKZMJRfHXFVYzTbVVsiSeMDBF6IyKdiRJE
         KtjCm1YPreT1d3391fDnMCyyQa525nSn4NMDDUG/RD5QQw6A8YrLKx+xFfO9PlPccGCE
         YH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:cc:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5tlCrbD8mv1LWxZgejXr6HvW6nzQu1wKhUMcdL1o3Jw=;
        b=kTn3vBY5HIj+EIm/GnB1J7oAXyDG8nYnPmTyH6Sh3TwGAQ9kBBO6lhGRRcI2aoiToH
         7w4Af+QWCyITklFQ30kRa5Q/PyBqpwaPAjHZ8YqEoHoEFbHhLmUMuGwoGs/JL4zisr8P
         bDPz0vBgqrjicoTnT6/2kMTOxZu+uIbX2ilAtZZJ4JY7IKYOFrjxELyNOwNVhtmW4SGj
         mORNj6wc/PDasVfWMFN1L0DsV0UKctjF1SgR5ewnPgo9dC55GsQwPhVRJHUpP8UHEnjS
         qOllde6/6JzHNdfg1G+m++jp5AdDh/nahUVTGcm5WTcyqOkXC0qzmn4fzgdj5JBNfIkr
         ZkxA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ0HAt7hARSwqBHutl1/oLQIp606AvQixYjoFcGAf33MYsdGVW9k
	Yw+VhoTel3u+RgraJNXCJ3o=
X-Google-Smtp-Source: ADFU+vu6r66/j5JZqTOSogK1u1FTgGMH7HlemC9RzVErF7gX9kfONVVfRFyhsSGPM+aNXv8Hjbl+gA==
X-Received: by 2002:a5d:5386:: with SMTP id d6mr1088190wrv.92.1584683588558;
        Thu, 19 Mar 2020 22:53:08 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:cbd4:: with SMTP id n20ls2154619wmi.1.gmail; Thu, 19 Mar
 2020 22:53:07 -0700 (PDT)
X-Received: by 2002:a7b:c0cf:: with SMTP id s15mr8366501wmh.106.1584683587671;
        Thu, 19 Mar 2020 22:53:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584683587; cv=none;
        d=google.com; s=arc-20160816;
        b=KQfXmYJf95Y5U4oMniG4uMtZ8BzZPrYZb0uB201FqTmUVxPF7xmVVkNyzjcFxQ4LSy
         aOhjRFNpKB1r0kkRLIFhrFQmOOY2cEQATptPa+feEz2pkZinTP4aas3TKQ1TPus5cpiL
         dg94rmJo+6sE0BsGHxKy/Dbb23nR34c+wA3lVY9mfdQAg7HuYHYZ+6AaFppuyh5XJp4a
         cXLXQLUHBTjpxl4FZzT0lKXekR4rwdsUGZ4kbI+8UNdC1dv4/S8vbWSJQh6UXJRfYV8u
         AwDajqFzgbWGFTwZxm1nw7XYjUo8ZEmfiGr5VTB0GdzM6an2+BkaiTVdwL4+JTiEZ6WN
         Leyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:cc:to:subject:from;
        bh=5w26gygvNxjOXcgXap52t664Gmo6xcmGrx4ac//2vtg=;
        b=hNc4qE99+6K27ovva3Nmny+q8zLCbMESNXt94KRP/X7QOAkZvoj7hZ7j/iFl7n2U1R
         5iRA6cQtdc1dLbCQ/osstU8MeEABog3UeSCjsrCQ5xcq1KPKCWqaIvSDwLZPVLT3mfsp
         yc28tXckYEw2OCXFWT3xB9krjo8GdGutIaoAtabIIBIRb95eX3b1Bm1+FlDG9t1fg+ut
         tEbjzEOyFiubCXZ5aJSBO2b7N+2KoQGVjrTjiB8JWLZXESQaxp6GoM5iKFIy6VYwR0Wk
         GA13PjS1PNu8wL0kL8zaQBQDOjNNgMKyvgWE/dWI49LIW43ZLnM4Gld95okMg5trY8lU
         DYBg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id n7si373031wmc.1.2020.03.19.22.53.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Mar 2020 22:53:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 02K5r7xt027263
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Mar 2020 06:53:07 +0100
Received: from [167.87.245.142] ([167.87.245.142])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 02K5r64U006655;
	Fri, 20 Mar 2020 06:53:06 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [jailhouse-images][PATCH] non-root-initramfs: Allow compilation as
 root
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Parth Dode <dodecoder@gmail.com>
Message-ID: <a46d17d7-25be-0fa7-5a3d-54f73bcdcf0b@siemens.com>
Date: Fri, 20 Mar 2020 06:53:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

From: Jan Kiszka <jan.kiszka@siemens.com>

If the kas build container is started as root, the host-tar configure
step in buildroot will bail out. Beside accidental manual invocation as
root, some CI setup my generate such a scenario. Avoid that failure by
setting the env variable that the configure step suggests.

Reported by: Parth Dode <dodecoder@gmail.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 recipes-core/non-root-initramfs/files/debian/rules | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-core/non-root-initramfs/files/debian/rules b/recipes-core/non-root-initramfs/files/debian/rules
index 6f2638b..95748e1 100755
--- a/recipes-core/non-root-initramfs/files/debian/rules
+++ b/recipes-core/non-root-initramfs/files/debian/rules
@@ -13,6 +13,9 @@
 DPKG_EXPORT_BUILDFLAGS = 1
 include /usr/share/dpkg/default.mk
 
+# Needed in case we run as root (for whatever reason)
+export FORCE_UNSAFE_CONFIGURE=1
+
 override_dh_auto_configure:
 	cp ../.config .
 	${MAKE} olddefconfig
-- 
2.16.4


-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a46d17d7-25be-0fa7-5a3d-54f73bcdcf0b%40siemens.com.
