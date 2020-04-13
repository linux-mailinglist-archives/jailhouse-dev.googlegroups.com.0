Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBLEZ2D2AKGQEDSIJDAQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 848B31A6341
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Apr 2020 08:54:36 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id o10sf6236925wrj.7
        for <lists+jailhouse-dev@lfdr.de>; Sun, 12 Apr 2020 23:54:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1586760876; cv=pass;
        d=google.com; s=arc-20160816;
        b=CtTn1fqLLzSdqE3wMorOxvkBy0s8M884RjVERnNDMalrpI6PQvfapY93FnAAhKIiU6
         mjotEnYa9h2q65Fj/mZtZQM0zb/uzXO/5GxKm2OaMnQ63Ne5O+hjcM3Khn4U7fcz7U6f
         NqfahV6SsIy82yp0Mfx2VUY6rJfGNo9mHpHbQ9/fw0VPzd5QWrha6cUVFOL/RFj9vGGP
         k7mjPPACa0sSWgLjpfyXP+CVKSuqjVSnv8IhrYFG16nGie84p+zsyQXwtK7L6CJHSl1N
         x23THo7Fu7NBkyP8ZcSoQ6sVQ2qYBZ+ayfxqeuprjKGyeb3UDGqUGCY99cQ5t6woHxIk
         I3IA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=elltlUaIJ90gSGEYXfeSzIFjdkv169dPFJJ0ZC9Edn0=;
        b=eM7bg6XJ5826iMQ8uGjyMuP7I4GHS3vHKG9EL3qYCq01PeLKcRVKgvXjYUdlC8yBZ/
         JEL1EbnDDM1Ed0vdfiqGVJxbbfYQWZqciaUFsN5HVMqjcy667L5YDtAtY4lYgsp8rarl
         wrUuCQR+Z6ZdRVDPfsf9NoCkKCFUCi4AlCBKiOhFZmiMKmhL/fp4wIXPw98EllJJIlA9
         Wcj44uin71i27cAidN0CAY+7TKjVOjrDgZn36v3lsAzN9xk+BZwKd8jZboYZWlghQhLQ
         AeU+Bu91saphzI8JR7iGY5wsVwM4BSPEukcfEjJ2FLdXnNyHgV8atEhygI9xPouJtREX
         REsg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=XO2wa0ol;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=elltlUaIJ90gSGEYXfeSzIFjdkv169dPFJJ0ZC9Edn0=;
        b=CiUIJk0D8BHkXttsoju5Lhcfen3GNWOURPoo9Pj6n2W15MhXVkLxu3lworAyKlhO5S
         uw1kX2FX8CgSpSi1aaaIqvt9bw9GcVE7ahn492ITDkWLpOe2fDEh2D2wigALHgOVPZXf
         5uWGhCMgAk2wEadMeyFPqFAVJul2w6khOrPEa4buYlfdlY/00yAyACgR7X7rMuU4Bwxu
         2aYoO0ktOqi1Rn6e8gQnkosPLk/Ubiakw7O0MSFsyvuHOqMLpRAUqFddAeNwbqnsYzYL
         lblEv0eh+igy3Kto5jgfmTt+bxJKoNPyhleR8onjacHA4wf7lOwfCR/mY8DHz9qTWkHz
         P73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=elltlUaIJ90gSGEYXfeSzIFjdkv169dPFJJ0ZC9Edn0=;
        b=IckMLLV6SfadrgF4baVhR1cDGUwopkwrPF3cM7kfDA2lmrzLALVqzwK9AvCNC/kEz3
         sAvgeROxzb+GXTmfg9c1FIOLcRHsHpuZAcdXIBq6cfO/+NNp/wvrEPAi8ZX4iJJ67t4Y
         uiicHbwyO5GVYDh8lURgMPEMalxah0Jo2NtrNCMi2TSDCxUJ/Otog3NttAeHgXbfIW3w
         s+i5njV8bENvuSFvAUFaeS1g38vrAo36i6JrXQD2Bh0/XImgR/hSKQC9ffz5RsR2tQFW
         BYrb7f9NJSznzWaOM3YWZ85iI0s4YX5TIwY8oDhY0UyCAl568Zmnf7c3UdRxRHzYC5bD
         Ba3g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuYY0hd2B8ClIruGYfxYzdYwsO0z2inJ2uXg89OuFXsBNHe5yM1j
	ZqhL6R3uWXavbhipd8xVGSw=
X-Google-Smtp-Source: APiQypICLjN+rcrMguc4BLncIs2QddWbBzDSP9m9otnJGqV7s3cFs25WWyXHt5pU8+SQbU3nQ7mlYw==
X-Received: by 2002:adf:f04a:: with SMTP id t10mr5106788wro.64.1586760876229;
        Sun, 12 Apr 2020 23:54:36 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:e44e:: with SMTP id t14ls4065036wrm.1.gmail; Sun, 12 Apr
 2020 23:54:35 -0700 (PDT)
X-Received: by 2002:adf:8149:: with SMTP id 67mr17256029wrm.60.1586760875754;
        Sun, 12 Apr 2020 23:54:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586760875; cv=none;
        d=google.com; s=arc-20160816;
        b=isdPPg1IEeQzsXABoQVMs2JYszzkXN+9Lp4+bLzec6lEi/uG2NpOamwaMyRnVdBU0D
         /A8dZpT5I/KYG9R8vMLkn9VXq03zmQGglQk0WLiWK/sw0Ge0DvCHuGs/bKeMZClfSzD3
         Ivw1MvgpwIyLoT5naykEjF0xpFWV/dArCy88wWdUgEi0EP9V/hG1bHc8e99KwOPCIwu2
         pGOnirfKbIImpvORf0Mq2E/cntftbjVgvEcdMsnYiFD+uIDYYkfpMmtmKc69SPYtrlee
         ddtShaDoPkELK9HHueuhhnH1Vfw/0UipJNGrAxTlnafmXasEQ1NfhjLxHyKJZ1cymMA5
         VosQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=0UDqpp32a2PYex1R5TxtqrDkcVDSwG7ilC/4r706Bk0=;
        b=OK0ldk1pmwtGfO3wV7zDrD+cUk1bDT1xG4+uRrVCxXjeWIytJfGkbS0M1UDd4GvL1e
         WElFup4X5mP76vXa2zbxtmXtlT6NPSdYlkUplP0dAcmAjwPk98HUc2ttxcpwwNg01naq
         wIifIe8T7mtLIpY/ipxFGP4Dpd0f90M1yyMDVdUi+xt6DIdRfV7/cnLMNtZSdPJw1nvp
         UsZFagQPjZOYxWcQdQ+L5d/jO5aS2qk8DVsCQVk7CM3QQ54fC7fOJ3RK3Vf88cOp1gTE
         UcGJe0aEaVRZH1fOIIuwLS9s4VIv57JJ7zynN/QGGs3fyusdfz0JNfxyn42K1/IawPcp
         zjBA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=XO2wa0ol;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id l20si597405wrc.0.2020.04.12.23.54.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 Apr 2020 23:54:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([109.41.193.243]) by smtp.web.de
 (mrweb103 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0LudP2-1jFKJf19BQ-00zkX4 for <jailhouse-dev@googlegroups.com>; Mon, 13 Apr
 2020 08:54:35 +0200
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 10/13] customizations: Add SIMATIC IPC127E support
Date: Mon, 13 Apr 2020 08:53:52 +0200
Message-Id: <fe59a5edd510451c7979b07ac3d79bb19cbc69a9.1586760835.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1586760835.git.jan.kiszka@web.de>
References: <cover.1586760835.git.jan.kiszka@web.de>
In-Reply-To: <cover.1586760835.git.jan.kiszka@web.de>
References: <cover.1586760835.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:RcvERPzgmmUnhrSeDhR1QKY8aWLTnjdWWnVX2nNqepbPZVfxPWd
 3BVTGjHVgWcpM2agiGmC0Ymijd2LPqiKahwRikxhJ3TcFmiwqYDjbTviiTu5eL25ubSkq0E
 RiQieMg2goHNcWpx0J31j6RCZzTANeJ8P3DNj9ARBl57S/yJ5BUAQKz2Sy6wlPDApMSNDdh
 jX8svKLQWfGZ97aQQ2nWw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nL15/aRc1Eg=:FbCbFjBtaVC3Pt+ZDsSgX7
 BOozWKc3J2oLuZcICHM5JGL+UNxa7HQ+0GV9UrF+tuPWBCoVy9BFCXyAYxWOpW0mFgejgB/tT
 QqiuZJfjl1QfZTuC04D3GnnLu2gu2Q59LejDt2lLLdOY2PecB0wOyz/iYDC3+/WGyBPjEkExI
 pwU7h0QspY7QHx/jqzF+xwpnpHzl+Uryi8QkFzJpS2YIOH3rTg5/fqYzj51RPsqi0frL0qaA3
 s3/vYnJVxbY1E9dEf2EnCN4jkrHgmgZ5A2kewjdHFwnh2sSakClRl0kqEB+a3aWOodIzMt5iy
 wToeSRdldhByGicQg+3U1gjGrgiOaqOr5S8LjHI03A5SFefscw7kYLkMjdPrJNOWNg357GUja
 7E+67oXCYuaRRdC9u5TtVjjKrv/R7AbdxP5JprAk2rRoUHtICCme9E5zlMcgEprmblEpcfBjK
 LJ0dVzIJI4Uo49E8r+EuPxGJy0hYsZg+qT9BxSe+N8LLvR3OI+p3TpGatZ4A+JhLfu4kuMovx
 8c0vT/KKBkHSARmhr+0SbjT1RPIjil0+5GzGkVxGTuOZ1VYbxEnfxpnszvE2eHfGsYE7CttNc
 qsbtebULTOjcwBAL7sW+7rXfigklNzkUNpRJt9J2nbBWVGXnLCS/TfU0vqSL36ciTzMnmw/cH
 AB4cgkF0REyU5xzz6LuE6b8h7y+HTyH9LfHV0ZoR9zbE8SVTOXMOP7ePhXOd2gUX2NSGWhUE4
 YKIw0C2Hi51XvIloj9ND+qeylXOSXZb9pLPWn5zTXULW45+hew3u5IgbTSqymO9b4IjytN53L
 XRMV4a1/cdOBCyTFLCcITtDXfHLNnvH4xtpFcUQelF6r036sSY6a4u4FXZmE2X0zXbUwdqgAZ
 0yA/m4eGa3MB22JpULPuUfv7fhLLpTEK8zZhT5aSKR1EI51DTALDXSxZTBvXYNWJC7rVjkCO0
 Jv/I2JBpEGiliL96etIJFvjE9Erw3ORGL027fX+zFRCvpvD17sd9Rh43mK6rb+Ri5zyPKVEIZ
 +Wrxyz69K2guLBsYj3KAHEU95fscGh/wOgrt75a4l7TnRc4Bs5KIWCVf+2zeSdiyylf1zSNfF
 9Zjr6XZtVCFFQFNgyowFpqlkAXMv015xPfBOS4SdnRgJfgGaIOmgIO+YIJ+XiXt2RzacmsQr5
 HnNz0lZIlsZXd5rYxqjAPZ44+shs1ONRTSHf/zqFVSzZYM+KXysrLDCS6OQWLprLJ9qcPu3pz
 JsIL0SjWfiN+ZMcdF
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=XO2wa0ol;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

This x86 target is fairly similar to the nuc6cay. It differs in the
apic-demo that allows to specify a register to make a LED blink.
Furthermore, its Ethernet interface name is different as well.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 recipes-core/customizations/files/.bash_history-ipc127e | 13 +++++++++++++
 recipes-core/customizations/files/ethernet              |  4 ++++
 recipes-core/customizations/files/postinst-ipc127e      |  1 +
 3 files changed, 18 insertions(+)
 create mode 100644 recipes-core/customizations/files/.bash_history-ipc127e
 create mode 100644 recipes-core/customizations/files/postinst-ipc127e

diff --git a/recipes-core/customizations/files/.bash_history-ipc127e b/recipes-core/customizations/files/.bash_history-ipc127e
new file mode 100644
index 0000000..0868c98
--- /dev/null
+++ b/recipes-core/customizations/files/.bash_history-ipc127e
@@ -0,0 +1,13 @@
+jailhouse enable /etc/jailhouse/ipc127e.cell
+jailhouse console
+jailhouse cell create /etc/jailhouse/apic-ipc127e-demo.cell
+jailhouse cell load apic-demo /usr/libexec/jailhouse/demos/apic-demo.bin \
+                    -s "con-virtual led-reg=0xd0c506a8" -a 0x1000
+jailhouse cell start apic-demo
+jailhouse cell stats apic-demo
+jailhouse cell destroy apic-demo
+jailhouse cell linux /etc/jailhouse/linux-ipc127e-demo.cell /boot/vmlinuz* \
+                     -i /usr/libexec/jailhouse/demos/rootfs.cpio \
+                     -c "console=jailhouse console=tty0 8250.nr_uarts=0 ip=192.168.19.2"
+ssh 192.168.19.2
+jailhouse disable
diff --git a/recipes-core/customizations/files/ethernet b/recipes-core/customizations/files/ethernet
index ccc7ea6..8531662 100644
--- a/recipes-core/customizations/files/ethernet
+++ b/recipes-core/customizations/files/ethernet
@@ -13,6 +13,7 @@ allow-hotplug eth0
 allow-hotplug eth2
 allow-hotplug enp0s2
 allow-hotplug enp3s0
+allow-hotplug eno1

 # used on qemu-arm64, orangepi-zero and espressobin
 iface eth0 inet dhcp
@@ -25,3 +26,6 @@ iface enp0s2 inet dhcp

 # used on nuc6cay
 iface enp3s0 inet dhcp
+
+# used on ipc127e
+iface eno1 inet dhcp
diff --git a/recipes-core/customizations/files/postinst-ipc127e b/recipes-core/customizations/files/postinst-ipc127e
new file mode 100644
index 0000000..2dde661
--- /dev/null
+++ b/recipes-core/customizations/files/postinst-ipc127e
@@ -0,0 +1 @@
+# Nothing to do
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/fe59a5edd510451c7979b07ac3d79bb19cbc69a9.1586760835.git.jan.kiszka%40web.de.
