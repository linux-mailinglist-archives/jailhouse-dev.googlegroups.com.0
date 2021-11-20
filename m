Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBYPN4SGAMGQEYNZSDOI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 81224457FF1
	for <lists+jailhouse-dev@lfdr.de>; Sat, 20 Nov 2021 18:56:50 +0100 (CET)
Received: by mail-lf1-x13d.google.com with SMTP id x17-20020a0565123f9100b003ff593b7c65sf9010835lfa.12
        for <lists+jailhouse-dev@lfdr.de>; Sat, 20 Nov 2021 09:56:50 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1637431010; cv=pass;
        d=google.com; s=arc-20160816;
        b=EH2e63IZaket0jIj+F0mPFFXbzgoSYALQ56EuOyl9E0ICl3G8ogfzya0ibYFR6sX+5
         VSFOWHp7Q+4r28zJnHpPjFOQWsunrRquUmkkcYTO0ArlWAtP1Mo+Lxner8CSmtQIe/aG
         9HD4i2nB/3Xeh0mxHDgsVrvrmkob/8Fhtszx0MH8hrl4EpwPqylox0cb8a0tQ7z1BWM4
         78gsbR0qyOELMyjzTdpIaj+CSAiulJgQi2m1UdunrLD3H1r/+fy08ipqMBJYnXFBFHHm
         cqpwj+fG5VmAb4/Dl+ApRIyY49nNuJkNbxVjD8EVvl4MlHYkFk5uN07wvjuYeX9v+sv4
         Tx8w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=69Zvd19ws4UF6W4VbVljRNjDWZDNGS6UVAjKCxh4DCc=;
        b=qbsSw7LgBj1yDXznj8cE0bRIpLJO3cn75zPHx7J6XvhC1ESo+B1VHarVdPHbAZHbqG
         pnSCp0mDVHhvw7WFbZ87l8DN3Por6XfoYXTPi3FyddlKB1re6BAN1ff365VI2qhpdsUm
         hhTfYIu3VDet3JoYpcyIiYpjc4Q08yoF7Qv9eaD2v+uO1Gb0OFBYVqao1NEv4hTYIGkG
         4O2xYuU52pOclSSYZJi9WtgyMZUJ1Edd1HoY0YvRSREOILv4prEapQjNKq+7Ze53MOkN
         OySnByyTEvLqaD2pg53yHiPzkzMftzcLZZyGiMsqlw4Hgcqc7pHAD/Xkrt9n4KtGurCy
         np0A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=sMXE+QeI;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=69Zvd19ws4UF6W4VbVljRNjDWZDNGS6UVAjKCxh4DCc=;
        b=AuEAvJMQnhJSGL3CTZcUJUDbppAgxzJq74Q/Vwn7tjnG2luZ32bvT8r7Mu12XVtmhR
         2W91hFqNQeXJmcaDG3lX08YEnim8taSWuUIrTmZSTbxm5ktTK21qpPnLEzdp141V9HPj
         RKADYuCjLTLCY9f/SeNh7jTrXVi+XOPDy63LEzJsEwbIKDIr7TtyOpVypV1R96/zzobC
         vg+5QdZEh3u1eBxdok128zF73q3TskYBCQp2Hc4URlxQSi0T3hNhIS3++jTp5NH4uAHG
         yoy+E++nnxsi+04SjaMs/Hs190llfmvMxA0Mq7j6GYiikqp2458TLr1DClCjzza/Y3sJ
         Cqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=69Zvd19ws4UF6W4VbVljRNjDWZDNGS6UVAjKCxh4DCc=;
        b=hezxZN7+nL1q4QjKDjLz8oN043SPsFrwmZ0+aYRhX8s+QzmX4gOby7KTlGGtdHqNmW
         M4iP5wZuFEjX4XPHpNREbjriBnbjVQjg7p5laKpyn7H1m+ySZN7JIYl8pQKWhx9iUTM5
         csZMskVkn8R3FF2RZ11oBXZdGd/YwO+X6UuiIwyw0qgIZXCMcKa4icf7ns81VJeW4c+F
         cQfZAxfH4GFLOcqi49qGUdZXEaoe4HXNLdqNpp5W/u4MZ4gXtzKcW+97paqVEkxQfphN
         VRnk84hqGbdOr4Q07T6fNOjvXEM/VABkgUil+EVpVpmzHO1MX2/Jcep0mkEJOwZXGKkM
         xeRA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531GWPrc/EvnEmdhCgTvRulzk5KJrDHNEIy5XKFBTrPlpoy4Gk/N
	1ECaMljpatF4u8BankqVsPE=
X-Google-Smtp-Source: ABdhPJy2xQnovf8rBr9U408f/6fR31B/gJncsLEfjGX4CsLJ0QpA+/Ox+fI5NObPMI0VMOmiQkfnTw==
X-Received: by 2002:a05:651c:4ca:: with SMTP id e10mr34453453lji.101.1637431009969;
        Sat, 20 Nov 2021 09:56:49 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:a4c2:: with SMTP id p2ls384789ljm.4.gmail; Sat, 20 Nov
 2021 09:56:49 -0800 (PST)
X-Received: by 2002:a2e:9a5a:: with SMTP id k26mr35497814ljj.9.1637431005908;
        Sat, 20 Nov 2021 09:56:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637431005; cv=none;
        d=google.com; s=arc-20160816;
        b=N/L/xm9yMOkJZ1tNryDblGGE3govlGd3vWWLYXbsmQDoeadux2ZER9vsubyEnfoNxn
         2VhiLo6YiYhaR43Hj4AV5gPJlZAVN8ZBjy4EapcrgLnSLK1FyYtn85Jg3Lk2Bsnuk9nG
         GkCPN1rAfUCYNFwVJ68PBGI20OT1D6c/CYUGVR38xQGB7UaYrxXY8MWRXJzDg7l0Y/LX
         9+rS+uF4DASfIGbTw4VZvYAjHBWeFmXqZBjbRXXc4FG8jiauIA9DeSkA0QPZP3J1+k3s
         mMyExe6IONfECmFVQvn8MIR85BQB7yxD37i6VL/ap1PSm4Ud1M6P3lBRw3t8H2zLdJpV
         AdKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=OdwejSs2rgiXyJSrdTmznpqgwc4iSiKMCRpG9rnNDFY=;
        b=g3Xb9udge8LHM93NOdsRmB7okB5/reP40omc+YrtDZ0bZ8nPFh9R82VM2Ga5x2exDM
         GVLGcZ98mMh8JjKnI4YHDnQUTGC7pbgKxwI12N+ZnciLngbWqN/4T8EZuUFRRzQEwH3t
         REDX681vdazQnf2CRFAeZLeSU2YtvwhXrakfUebUAQ+uYnRCoDjBer7fyub6xFnwZz9/
         cSmqDrx8YqleWXvQ9uSP0PUFEL+2+OOlBVf4neWbktPPxYaxYzbAN6BphBVG6yzd9lKT
         SWEYNT2tiUxZGulO1wGUb4LJ70B+0PFv/iXB3oDqqPhCS0/NOcwJctXijVIAb2hKubW5
         0xUQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=sMXE+QeI;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id t71si186722lff.6.2021.11.20.09.56.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Nov 2021 09:56:45 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([88.215.84.132]) by smtp.web.de
 (mrweb005 [213.165.67.108]) with ESMTPSA (Nemesis) id
 1MIL0C-1mtw7d0KrE-00ERrc for <jailhouse-dev@googlegroups.com>; Sat, 20 Nov
 2021 18:56:45 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 1/4] rpi4: Allow real-time kernel build
Date: Sat, 20 Nov 2021 18:56:31 +0100
Message-Id: <387ae823320daa8081c2524a47c2171a2707532e.1637430993.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1637430993.git.jan.kiszka@web.de>
References: <cover.1637430993.git.jan.kiszka@web.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:BpsinJero0792FihQRlO3Lmq+LDhtGjuRpphLwhiiUBGgPP/11u
 IU6uwxxezznTnJBjP4tDIykUy6teW5pX1iwB/jP0OV3mHqDcyxUUSszZJLY2X2mKBZZVzLX
 GE7D9nIq4ap+Vc1pY5kNEA32LziYy0Z62ulttBKKLQlvcgLya62DGFWQ0NKIhhzhQfUXd+0
 fNu02YJhtVHGyp9rXg7Fw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:z27VO4K78lI=:0eD7aZVtqtXjjnuqT5Rjmb
 kfS97bd193R9eZG0vGYq7mgnwVAA7tWDHyZvzinc19mYeNRMer9pu+4CaIWyI7HYBraqtlEFb
 pIYHoWNNgw+m/O0wPYQhMPRXq7s2yh6U5hz+t70Xe/FGMvk6ENHHhFarvnFE6FzgMh/cwhgPg
 YdNQbZ0uFSqNt5dgGLJEdyY43yvFk0rNMTfkm9WG2/2pE4/2G/dKmlBzPcyV5F0ry7WZp1Kad
 XLSyJUUak6Ki4bNS+irM2mh5p3kR709jRP9PcFOKnHAaugtBYphfW/hYcCRL9MLKx7DU6NM3g
 LPowBezOqv19Za5LhJnnm2kAAwmpx3ympBDbNlEfWj4gjtvZjXFZXHgoucjipNVabKAiNjHgG
 YRX//3P0qIUqK/7QzPcPm5MbTUhclmXMJ8FnVYqvK2sC5dQo7Q4RyMEviUafyX4RIaC76zB4X
 Mbm8iuGcIJKbFeugujmxokYVAdxTcMndAxz0E655ZFyPcJpo9wj/YUb6yOIaO/rtwqJRCEsxP
 30i98G6l/9nG+SgiJ+ZzXciy0ViTXVNqi5DgaFUb6WQsMvLEzTBVz+JX5ESMXqQuuqL2kPkcW
 cVxv7mnQ4Kj4N1ZdviEqlZYmWc14kOs9MYtT4D13jp4uI1/MmCTBbwuYni+h5X4sBosamHNia
 4Q8VfHTGfHUjjavKNpQB16Nu/V/Zs3ql2chBC1Ob9QVvYToNVBd+rwvkhZdrD1lw6u6NKeFLM
 498EqR1lqqlMrM9n18WG2nZ1wULYYcDugljHGUyTGvpoyvu01Z89/JWPmNRgj/R+XGWIG097o
 TmGzm8RlZieHsKU3geei3Ogk5SnhoLbXfeBCSEs8TsNjuBx6WqO6/T6ExgCzkFqjBLyRmxzlb
 9DqqWEDo4B4lhFZpUn3npgdEgxb9PjFL1Sb63DAD1LnvSC1RvgpRCNenvj0tyU9rF+cKxlH+z
 LV3cCu4VrDt6AKEvlfkmhH0nFLpB1L+2w5uiBzcSed7qWLuDcEwrClDr1u3su7WMX9I310glF
 In4ssCq1EiYFSQFpCWSUbHQSxXBKmTaJWCj9Tf6KZMZchUYJ2LD7U/e/6/QELnNE/JTQbKp4M
 W+dX80DzUhHW18=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=sMXE+QeI;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=web.de
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

This became possible with switching to mainline 5.10.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .gitlab-ci.yml | 1 -
 opt-rt.yml     | 1 -
 2 files changed, 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 52692c6..1f4c80d 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -16,5 +16,4 @@ all:
     - export KAS_TARGET
     - cd ..
     - kas build jailhouse-images/kas.yml
-    - KAS_TARGET=$(echo $KAS_TARGET|sed 's/mc:rpi4-jailhouse-demo:demo-image//')
     - kas build jailhouse-images/kas.yml:jailhouse-images/opt-latest.yml:jailhouse-images/opt-rt.yml
diff --git a/opt-rt.yml b/opt-rt.yml
index 4ad2b23..cb521bf 100644
--- a/opt-rt.yml
+++ b/opt-rt.yml
@@ -15,4 +15,3 @@ header:
 local_conf_header:
   preempt-rt: |
     KERNEL_NAME = "jailhouse-rt"
-    KERNEL_NAME_rpi4 = "not-supported"
--
2.31.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/387ae823320daa8081c2524a47c2171a2707532e.1637430993.git.jan.kiszka%40web.de.
