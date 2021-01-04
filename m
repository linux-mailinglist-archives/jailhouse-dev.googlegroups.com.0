Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB7PIZT7QKGQEH2CFO4I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C96D2E9888
	for <lists+jailhouse-dev@lfdr.de>; Mon,  4 Jan 2021 16:30:06 +0100 (CET)
Received: by mail-ed1-x53d.google.com with SMTP id f19sf12337170edq.20
        for <lists+jailhouse-dev@lfdr.de>; Mon, 04 Jan 2021 07:30:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1609774206; cv=pass;
        d=google.com; s=arc-20160816;
        b=L4dheMf302HCcz1T99SGWNHjNStWvBYuWwkc7BeqotqqcGbu7zxdrp2Cxfq4ELrtdW
         lrH+dxhT4l/tU2xyVKQ6PSjpViAceV/FL9xw0FZSQ0k4Qu6TuU2JAQR5LSioA+FPmcPZ
         d8SZPlXL20vZ1WHcJRp9GxsUpOk9x8Pk1aNS/7bNBfEKo4CFZ23AsO8G5fI/WLRES4M/
         q6Cx4SHRXKzeMQs+BF3XzbB2MmstlVgTUPCsMSqIt8aN9c/K73f7mUFjS+WhO9LNPrOg
         z/OW+DVRnmas0UXp2hGFIDhFbbxYfmadS8zz3u2Wz/2pEmwmRO01YSfj5d/BKo4BERWK
         Ax/A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=iNFTr+yE7ZQExkAz0JHqOqnuBY0RUPxp8gFcAfx40YY=;
        b=Shx1vAk2JZdyn0ZSU3fZHCn4BfXmHgFrfwSxZwofuxER5csJdc4Z6hyg7Oyguzq00L
         hfCAfF//en9PU9UlqKKDkOQBZ5oRYFBn05HQmNfqD3IztssAtQjhmxrj4rpeVY6APE6+
         v3y4gXbJYVJUyZUitSUElJ7sduQnwQM+1rWydGx7Me1UD07FLZPh+OTWc+FmkelWTSgV
         Ok2DHVQY2Ob/w9r4n0VOhCIRFWpHL9Zdo5AaFWRQyRCL/laSKnnuZbtco6Xtw7ltDBpY
         2jw4ysWFSOhYOkJG70RnafSg6pGyYapAzUfvr1eU1qye0Nar/FAd2Zq/ZraFZ7OHvNyf
         f9qg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=lxLGmwCr;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=iNFTr+yE7ZQExkAz0JHqOqnuBY0RUPxp8gFcAfx40YY=;
        b=AHcUd49LOt9lHMY64dxJ9tiQ3Zbv4fkqZQefk96gxjUoUrW/OdU4D5dvANfu4HiQPd
         WLBOUVHus2a4zxiJ7bNSpBFmP/L3qFKnTK2BYRyQ5gaLJgg5C0yDmjCgQ9SJVGgoASMB
         XcH3utASr3r8EO8r6S9cfOEzRqMqMnglMt1h/+oibqH11kLAkW+6ZIMKnNtXoYRABqnb
         nb/s/r/FvV1ofBKPlpCXiU2Icppn3hj8OqpjvfcMYPJKweKC/Yf8pkqSlWUwheLgQkc5
         xYln1qlrrPR7Ef1wf7bLyLR6a/g08sJ0au9tjwPNLzmyE/mF9VMMJ0OOknpL2kMX9kaa
         Wd8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=iNFTr+yE7ZQExkAz0JHqOqnuBY0RUPxp8gFcAfx40YY=;
        b=Gi91swsZ1WlZgrMPdpJIOJcMIU12mwJIaqq+/jRktdOzNRhkXyNxNH8GA82Kxv4FZh
         fUGQ6j9KEgPqf4uYt3ufR5NzDe6pFMW1S8Cxe1xQG5Ajj5WUyonMdxmB+bPyLit1n8lv
         cpHj8OJD3BOa+ZH3X2zm6s/643rR5vz08mjv8ikeeswpyuk8DGu0BoaT5fnAgCuGFjtM
         7xJX5ORsRNcd0rYOGfzDKFEdZxW7WhrHPAKBuvtNFj1mXIO8GbuDxJBh8YxqVIlR85CO
         sbo9tS9S93MgifFsCD4JP+XBYk4tCNhVEHcfK+3ccTRDrZ68VqttMKMfbHsit2Det/gz
         RpkQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533cXqv76+6ad0S9uAIKjZ18ppFCCHhs0YkLBxQrXOHugfoo/ibT
	7gd2vvdM8aMpLjEc/GRdj7k=
X-Google-Smtp-Source: ABdhPJwVI/g4NSpc71Z6dOjzvxsZioE7YJgC9VRMrfsx28Z9heKVO7jk33dJMlzYzfSgHiAKX+eFKA==
X-Received: by 2002:a05:6402:407:: with SMTP id q7mr71369850edv.312.1609774206187;
        Mon, 04 Jan 2021 07:30:06 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:8a9b:: with SMTP id j27ls15546936edj.3.gmail; Mon, 04
 Jan 2021 07:30:05 -0800 (PST)
X-Received: by 2002:a05:6402:407:: with SMTP id q7mr71369749edv.312.1609774205069;
        Mon, 04 Jan 2021 07:30:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609774205; cv=none;
        d=google.com; s=arc-20160816;
        b=xQTUH2QwlPNufTiIAHxaM5wsdD+fo2bB0FZAPyaL8b2vj85D2UNx34DNrO6yK5F266
         zHLiGJ1RqEgSxadCw2DmzlZ2SRnWcfWiEDS4WHBOg+vw7i+HV1U2/cA7f4kCdjTTej1i
         vNcQ3poeHCCU/zDEdFfWsYciN/Hzac2NtRwaOi14ze3PBWDLOpX7NZ+9LTl0pjn763zA
         xJR8X8BbK0s3o/CRH/eKUdrKZhl3gmIq7HnxP4WCQa45drd2IvV2ED71n/kFIN8grtYo
         cDWwRvpWqYbwa8GK4n8iZsYixNai44ZQF6EwbpU6s1TXnayJ32ynz066m5cAleSR3bzl
         OQ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=Uvty/I47wUcKLJzs2qYynBRYjAtZ5gxGs69MpMHNxq4=;
        b=WF0z+ueLuMfXyKwp05DO0qOckWVp2mMIU0DnFj3oOIJNZDYmLcVc8SXTmG1O41Jkt0
         wL+nIEtQasRp/TcpYoVpzmcD4IlXlC7hKI9L0B+nafI5NJNBJe8AJO350yjI/Lc60fif
         cq5bfMzCpmQLC6ikOxPwyawHA4IByHbxIbPJmB+iU1I+vW5fL/cboHRGJIJo9Hctvqu1
         M++KbIeYJpNOnfLMz9xCrqLHWI7o/u7sbjrHCD6qJNyx2gFMheE2qjnFH6HhaKso6HGD
         5r5FI9hgbDmwI2y1RyM5JMrCR1wm36DRl/ROKZjKHJV5HhmV1ersx9owlS6HUqKIoiW4
         pfYA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=lxLGmwCr;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id d9si2063199edr.1.2021.01.04.07.30.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 07:30:05 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([88.215.87.53]) by smtp.web.de
 (mrweb105 [213.165.67.124]) with ESMTPSA (Nemesis) id
 1MElZB-1kkaE32Cs7-00GUgZ for <jailhouse-dev@googlegroups.com>; Mon, 04 Jan
 2021 16:30:04 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 1/9] arm: Enforce soft-float ABI
Date: Mon,  4 Jan 2021 16:29:51 +0100
Message-Id: <1b4c2b27ccf2f873bc1e66e9b0182a76f1191a3c.1609774199.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1609774198.git.jan.kiszka@web.de>
References: <cover.1609774198.git.jan.kiszka@web.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:GhWLebwHjwabFU7MwAlWcmpBduwo0w9fuNrm4Rwd/SiiHtAUO7W
 omRjwlByExZZaXpc2dMJRWr6S9p+TkyoIya3tBuBz3OdJ1z5Hf10+w2W1L0luCh+uGp/9Fc
 BxOH6t3Rlx9NZLdfBzS06biDlrf+sCWlOsxytKWsbGoDQTc/RVrS67RchDyHGL79uck4oYJ
 yEw8bC0aVL1Q6q4OEsY9Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TtvEv6v8IDg=:0rs9+ytt/+5qBBxUwwrlQM
 TSXSIrYSxKrW8tue3W6NzgmMvNep+V/3EHiG9osWDcdUOI5HbmnQ7C/XHM550OKiRvSg93Q7B
 aKPBMhVsctdeVU2QxeSwaxwsWeY6urU4Q2AZw3D0ALMR0HBGc2ViJpf323mUo24ZJSR72uuAL
 jmEymIkqu45Ueg7tgQEVHHlkg4xLAd5I+96MOG7avewbXVIXoBv5oKtJXVpmKO0toGN/B5lpz
 EBGynMVXalElSEnJiE66z6I4N6BpuLgMxYNGb/7zAHsRfVpwJD5sz8sv37/c7KeImwQXNSoK3
 mh7D4W3Cd0768H17L+ePNATsfEhlmtf3k8yzdlv0LTQBY0MF6uGxtix9OpwroHmFGSnBs1ia/
 R3pUkO/8afUnX+zlLylEdc8fZv+dZ740bLNr1czdDzg9hfjGu20b7BnJlBjoXIDyewbNF6I8R
 nI4Va7O9jlerFXk2XkeVBdvJJJLpcsEicRAOgSISYSIjwqEXHPOQE1MXlCBGwS/1bpve0KKXb
 w5uvryK1HYyBZIJ7swf6ng2FDB8UAYnVv6luH0/fm4EA/FjqRVqr6yYMB4MexrNMlNPFEYD5l
 6MSTrW5vYVMn/mipWUe3+bAYO9JW4/tY6HmOISbnIflWa4pDTYAze6Or6mxbe2Whamaur+M9I
 GxjtkrOAUQEtDvVUAdvkHFX8wSeIxy/kYf4TSYUlxW4OS5+t59Pl+W1GVCgq6VCMJLSM3R+M0
 KycPWRRAh1VmrNs4ldqvmIwKD5H2kyMVhTwc2iaBOcZqtd45COnDQ/NmuWvOcdfEDXK0WbPpn
 UmhsZUw8bLDzf/pUheMm4EEpwfhSQBYDq2IeZVyNsQadVbTdyo+3pOW2IojDj0a02oQakqlwF
 DvFaD0mXWNiHR1nFQ2JA==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=lxLGmwCr;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=web.de
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

Required with newer gcc as we may otherwise "gain" vector instructions
that are not supported by Jailhouse. This is analogously to the kernel.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hypervisor/arch/arm/Makefile b/hypervisor/arch/arm/Makefile
index ad5b2276..a54370fc 100644
--- a/hypervisor/arch/arm/Makefile
+++ b/hypervisor/arch/arm/Makefile
@@ -12,5 +12,5 @@

 LINUXINCLUDE += -I$(src)/arch/arm-common/include

-KBUILD_CFLAGS += -marm -march=armv7ve
-KBUILD_AFLAGS += -march=armv7ve
+KBUILD_CFLAGS += -marm -march=armv7ve -msoft-float
+KBUILD_AFLAGS += -march=armv7ve -msoft-float
--
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1b4c2b27ccf2f873bc1e66e9b0182a76f1191a3c.1609774199.git.jan.kiszka%40web.de.
