Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBP5PSTXAKGQEII4PQQQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id E571DF4140
	for <lists+jailhouse-dev@lfdr.de>; Fri,  8 Nov 2019 08:22:39 +0100 (CET)
Received: by mail-lf1-x138.google.com with SMTP id m2sf1090158lfo.20
        for <lists+jailhouse-dev@lfdr.de>; Thu, 07 Nov 2019 23:22:39 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1573197759; cv=pass;
        d=google.com; s=arc-20160816;
        b=nOa5uJhGYIHiRHaCrhuEx9ipbk3yVdm+uvuvxSdTjr7y1QVpKeMbYZQczc+R3OCBHV
         oHuEUSP1JpHmXxaAxuKbu2rTEIE0wQMazVHF9PicZfF7EvOo5Ck8snOj17/X8j7Pd6Ev
         gQdE9fgNb6etOgjgKBRJpGEp41AlMC7lC4qsdQD8k7fPPJrBmYOd3XqJlZa0Tjg50Buf
         pLYoi7Wac/95dmV9BeGapLsYr42NbAX42yxLgtM9KusqPUF3IlfU+kowVUwpU87Pu54Q
         aYhWKmKxTa87DJaQtXLfg11zz+cJjr9MLCttR+XgB7tDD0e+CHiK1cumFEDz8BQP/zJ5
         Yr8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=S/R/TEMEosRVV40e8A/vWZCvtkuL1Jd0sGByKyXvQtc=;
        b=bf7pubMWfUfzgGKOIrWIpyR0ajPmXxhG+l68fHhCSYOi1ENKt/5B5Aanq3xS9sUsty
         cxu50oNmANRxKVjovxFiSj6vAV0iYW2h0tKd0e0rDkWuq4vXVu4pIDojkenD+By/VYQY
         yJNNvXy+IVfbq6KDfo2iiHsN2kIc+tkH2Twa4tLfnuC7Yy9AyxMj6dCc1PCMg6ckrF+n
         9Vwziktlh0cOknsG+sNg4+ZDfMKNGYEESczgmlR4BJzhMEb73yQh+bhQhqnpOPF9I/18
         l7dTF6fWE+nqrdCtWVRKfQA/Ds6uHvWKu5wR4jFnIMySzeHkee1Qr7W5NNnYnSY57xvX
         UALw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=S/R/TEMEosRVV40e8A/vWZCvtkuL1Jd0sGByKyXvQtc=;
        b=LmjmUgNxDCcdgeGWqGc3HPUfSGPma44pimxqKEDQRtojOgw18ujr8puYQeavTUkzzx
         FFsgeKGv/XtsWkIztuWIDh636leIU47jAe8DaEnldvKXOtGKzAkEV7n1CHeCb1YDbGbN
         t5KnQFgVDeWXDA3H9SLr6UFup8zZIryozvzgET6cfUdrhdtVGQMkZKl9SHoKkK6DtMxX
         imRTIWosvp1GC5ibjPNSoLvoEOusZPgNpoG+SufBlRiVKu9vs9SeOMlnOJKU77HEegYk
         P3A0JdqKK+Aik3hm6GZ9UDe6F1QoHSJs1Z2I4cVXPtB4g/o8kL8IZnOSvJe6YZMmCGod
         81+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=S/R/TEMEosRVV40e8A/vWZCvtkuL1Jd0sGByKyXvQtc=;
        b=KftKXod35dnwYfJLKXKEoIYqwkI3nZnzV1zluyLMk23V3jIOcVoH0Qc/4sp4YCZBgy
         APSrNxFSj5W4hO4uBSA+wyY15CmuFQmoxQC0A6RPhvV/Ku7tHVfucz6g+eo7Zmo6e/qw
         DaEZ5txpzsPFU2EH0FdkGrGSXCTzI1LGuu9ov5EPUJq2aMLB63GkUQP4Wf7t3JjvcLeF
         Talpq1ELElm65hcccDYcHwxWv3zw7tXu4xRnGqiG1LnZu+e1GMlTc4Ahfn1TwPiF9OiU
         YM7tYOryhx1oHnGVoznYiVr0qxgcNkqNqnNzJKhgiFbVw0As4dCtBGDm4Wa5qb1v/Rz7
         gyGg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXN9OYcfur//zKgReWqxluG2E9IA1peMqNMxpSjm4nY4+76UgoL
	1akfdJkHSNbITRhXXr5fFHg=
X-Google-Smtp-Source: APXvYqwyc+emCA2JQHzEeaHX/QBIPO3p9gOtx3qKtye+jy+w5If9W1ZUuXYwRsQKXDyJ/nOC3CWNaw==
X-Received: by 2002:a05:651c:20a:: with SMTP id y10mr5574635ljn.76.1573197759269;
        Thu, 07 Nov 2019 23:22:39 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:289:: with SMTP id b9ls2144522ljo.10.gmail; Thu, 07
 Nov 2019 23:22:38 -0800 (PST)
X-Received: by 2002:a2e:8857:: with SMTP id z23mr2241025ljj.50.1573197758102;
        Thu, 07 Nov 2019 23:22:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573197758; cv=none;
        d=google.com; s=arc-20160816;
        b=Uik71m/RGPkyip4WW5OvrIGhCKpv708y+U10aR7IDFbGoNLbNJT/qHG6fqNIOaJnjb
         pERBObPpfgAQdGCezuyGSlPL3UCR155GTBhyiodztKIKbaWAT3hxYH6d/su6/DrMu6J/
         Ai0iStxpkmpoGmcNs0GD7ZAHiwZCho+Ar9Kr+tXJDd5Js+aQQsE/8bDaadExNOI6baDW
         EzC0FlrU5kIxuQEEKoAkKjcujnjidgVIwK+D4oiV+ooYMvCUmgmQJ3/cYN0r3TdGp0z9
         dKAizXObog3c771wInLFZVRM86DKwsxsMTV6TIBEoG0pRtKX3aQrTakbNS+cV8naAdu+
         l2Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from;
        bh=LYYxWchU93RuXFIkqudhERpEFY/NJKdAAkyrSiHBC2M=;
        b=atwAT41uHqoRgvAe6Ygaku0JjM38vLxCYYSMFT8zkoiqpwrLIfxdLyyNK4jVP2qLpC
         0nrs3gYoksBtfTTFixwrG09awkjIdbCHpIG3cFB9hZrjX6eV8H5Cqc58zrrdsaPyUGbL
         s3WpEPVrnMKyaB8JELhhf/uEJA8TW1LAM4f5VDK3kFPbwLufg8xdu45L247cXsPOqeWx
         VkfSuaZM2Vlw6XhxlMEKAfb42epYn2XS+9JrpXAvf1PrAqBBbn2OrNsL2eKjwSh/yRpS
         rh64ZC+8TPD+bkpLF5XaQkE4ZGw13oCLDimIgU01GHbK0KgIGYZ5KeJ1k/S7rL5KT6Sx
         bq+g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id z9si388877ljj.4.2019.11.07.23.22.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Nov 2019 23:22:38 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id xA87MbxM032659
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Fri, 8 Nov 2019 08:22:37 +0100
Received: from [167.87.14.235] ([167.87.14.235])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id xA87MakI021191
	for <jailhouse-dev@googlegroups.com>; Fri, 8 Nov 2019 08:22:37 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] README: Update x86 qemu command lines
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <5ca5e399-b347-142a-ad9f-906863ca6c6b@siemens.com>
Date: Fri, 8 Nov 2019 08:22:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
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

With the next QEMU release, VMX CPU features will no longer be passed
through from the host when using kvm64 as CPU. Rather use "host" as
model and ensure that incompatible PV features are off.

Use this chance to align the AMD command line, turning off some
additional PV feature.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 README.md | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/README.md b/README.md
index a1c2f986..de70a8c7 100644
--- a/README.md
+++ b/README.md
@@ -269,7 +269,7 @@ enable nested VMX support. Start the virtual machine as follows:
 
     qemu-system-x86_64 -machine q35,kernel_irqchip=split -m 1G -enable-kvm \
         -smp 4 -device intel-iommu,intremap=on,x-buggy-eim=on \
-        -cpu kvm64,-kvm_pv_eoi,-kvm_steal_time,-kvm_asyncpf,-kvmclock,+vmx \
+        -cpu host,-kvm-pv-eoi,-kvm-pv-ipi,-kvm-asyncpf,-kvm-steal-time,-kvmclock \
         -drive file=LinuxInstallation.img,format=raw|qcow2|...,id=disk,if=none \
         -device ide-hd,drive=disk -serial stdio -serial vc \
         -netdev user,id=net -device e1000e,addr=2.0,netdev=net \
@@ -279,7 +279,7 @@ For AMD CPUs: Make sure the kvm-amd module was loaded with nested=1 to enable
 nested SVM support. Start the virtual machine as follows:
 
     qemu-system-x86_64 -machine q35 -m 1G -enable-kvm -smp 4 \
-        -cpu host,-kvm_pv_eoi,-kvm_steal_time,-kvm_asyncpf,-kvmclock \
+        -cpu host,-kvm-pv-eoi,-kvm-pv-ipi,-kvm-asyncpf,-kvm-steal-time,-kvmclock \
         -drive file=LinuxInstallation.img,format=raw|qcow2|...,id=disk,if=none \
         -device ide-hd,drive=disk -serial stdio -serial vc \
         -netdev user,id=net -device e1000e,addr=2.0,netdev=net \
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5ca5e399-b347-142a-ad9f-906863ca6c6b%40siemens.com.
