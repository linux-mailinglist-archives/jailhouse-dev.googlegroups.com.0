Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBWUQY76AKGQEAWCGBRI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAB629644B
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 19:58:50 +0200 (CEST)
Received: by mail-wm1-x33d.google.com with SMTP id l12sf719417wme.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 10:58:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603389530; cv=pass;
        d=google.com; s=arc-20160816;
        b=AnuFnbkyyJUpYVhsTFIjuOUa73BgbAEnc8oOm/k7pRgIyJneKAfexDAqWD5t8Qlk/s
         hIJ8vMrc6eL+WizPksDIDv4W+R7YJBpAVGazL8SBalmtx/CdHBJkyE/5OimnHcthpB4/
         6FxclGzaoYaCpQOIJvvK6fSoFSCLhOtsgK7Sabdc2f0QcaRKzev0NsxijlHKz12YHmJw
         hLheW4VcoDkqnos9aEUhkj2YPz4o74iKFQ3hEyYzGNOk8c13pao2Yo7cZgGFNQ+u3Bf1
         lUcchKzAxPfA9uZrv/adnN5plxOvQBWPmKTxKwzkgBtf5RqlVlEwKK+weYyR7oZhrc1Z
         wC1g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=s+NGt1EbvpFyTdgyg9QYTgUuYWYYrS0gqPqgf6ANRI4=;
        b=lnW0VcISXJLdyttP4UDyt04ZQ6PUtrA7hecpHZHvrZ9zouguoknHclnoZ82GECmo3g
         1OoQgGCC3RxEs61195WI00hNgnv5I7YjI/7jPKBSd0uKl5aC/aYpWs0myrUMZOi1vJK/
         qFUNVdJmigo5QTo8hZyhA66dizX7TW2MXUcI3SNhnkSuYmXAz1wjDRXFGzAib6oHbNKe
         gb5Epl0ZqkMwShfIloFOzQgnvUtumYvWZ7xiqeFrfUK6UJ+gfe3mi5kFwfDtZ+nxH207
         ztboof6kFyBl/c+hs9PPdWfgtHHRty573P6R6QYyVTePssXZKkg7knzPrVPpQwDTdRem
         K1VQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=l957Ha9F;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=s+NGt1EbvpFyTdgyg9QYTgUuYWYYrS0gqPqgf6ANRI4=;
        b=eOMNDz4U3qfbRvV4VTEctdSVOw3kcxJCVKNfMEwZypVSRAphn/geGupE6ft3KbwTCN
         d7MVluagq9o63k9UgBQMRzwFBLD+juWArnxjzld3cAkdB9orde6lB+jTax5K93t/jivw
         MxhvBag+qV46I6hXMKwmS2uNn98SCWrxPenBJ5kBW9NiaLH4isqdTwaSEvJrHG5/9HhE
         06IjKejZz3o8WPWcr1TqzZeuD8fd/fLd+EPUX2tg930CRqfRjAxPveRRVrrs7lTtM4jk
         6m7DeRkvdNKz/1cxliYWuevJ/QV829FQVl8RzTwB95z+DaiNytUvuu8qMuxdqo+ThGyW
         3pVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=s+NGt1EbvpFyTdgyg9QYTgUuYWYYrS0gqPqgf6ANRI4=;
        b=pROORq8Eyg6jNQt14kRn5Wn9zm5xVUKuNcKU8itQvdm0svOBr6KlOSMM7g8EEPtN5/
         xoLxt6f9w768KGRLAWg0pppYSXkBJ/9lFl2u3BV1mWIHh7ZzJkPDg0ZUjmNlclACnukr
         jKat9PDh4xoAmWzoL8cU/+rUgySDruEe9zJA8ZyHFXEfUi+V6RwUcQE8rJVXFzR/yYZS
         tmf+EnndMpz6XAfIeNcXFK9xB8QoJtJSRppq7ALW/1OEDIrYKrN1Akdvo4Et/Kea8PHU
         ypuJZa5ZsEMtmOmCmKkZ3sZ4CbOSegqEKoiYnFru1ppK0RMpprPZwE9MVMsKVn9DZx/4
         TACg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5314S2Qlg4sI2JJ9L1LoCzJ3i9WR6plDj61hbwCozJ6S0pS2UMLS
	7I6WuImGRi9WIiQAQ2tNVpM=
X-Google-Smtp-Source: ABdhPJwEObyIR4xy4RZoiw30WUoi+9j7bUaAcp7xoDUZjxAG/Pkz1IEADLS2Q7iUOkAxx9oDUtP89Q==
X-Received: by 2002:adf:ef51:: with SMTP id c17mr4278074wrp.301.1603389530402;
        Thu, 22 Oct 2020 10:58:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:4e19:: with SMTP id g25ls1439573wmh.2.gmail; Thu, 22 Oct
 2020 10:58:49 -0700 (PDT)
X-Received: by 2002:a1c:cc:: with SMTP id 195mr3914294wma.52.1603389529459;
        Thu, 22 Oct 2020 10:58:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603389529; cv=none;
        d=google.com; s=arc-20160816;
        b=t9qQFemysUyCrzM1s+vCcxjOOIZz1WcWIQ8sBRIniWnEessJYeVi636QlfNpN1lHnv
         oiQuQ2/LSaJzkDgZjLEnOPXJwp+XPNg7xBWpE8UxTzQMajddmSkNXThgVevyC+HrdlqZ
         QM+i27vWmeI2SjpMHIRZPb4MDz/wSUEHQ3dTm73IWAy5TtynnLlldwSP4q3Fnr4sfXg+
         sJv4MSXfCnxjFfZm/hri1W3j7z8jH54fpLB8ESxZ1neJYBHBaOQlsJlXHgWhZ+ux57Aj
         AVBXm1yLSV2dyRcR4joeOA20SW+OFwjEyHWLIvsAz65SyOcao6gXRVTT8wbu86CAJ5RH
         6c7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=tU+0YiaVspB6a8BvetfnaDU6O0Poj7BSmra9J0q8KCI=;
        b=0u4YBW5YzoW/owXmlPHtANF4/D7iBUpvPXA3PbJMM4/gVeZ4iKIyTP8eQl2kOY4lnm
         bsqpG+xPoDsiHxfDIS1rL+xOwQ6vzaQkfSil9C6eKhn/IPjG9x34Hx/1klbS/G1HsS4z
         olfbKdwAidEjFeU+j0dqnmvPUvv4W5gV7HK7GcnkzS6G+6SpyexX2j4yPfv6QUYdG2jB
         nVEyBqNk4K43X5D2AH0UWYsP+HxnKFo0L9h2E/fVtRzsmaG4p63UEVrc8/jU+m2mzIho
         na9V5O1v1yj2CuaqVahgJXjJGU5WUWzjLuADL9TNtxVLzgi4aE8gol4XQ7oi6VkCGM3/
         sEsQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=l957Ha9F;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [129.187.255.137])
        by gmr-mx.google.com with ESMTPS id f198si70457wme.2.2020.10.22.10.58.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Oct 2020 10:58:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) client-ip=129.187.255.137;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4CHFV1209yzyZv
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:49 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.877
X-Spam-Level: 
X-Spam-Status: No, score=-2.877 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_DMARC_FAIL=0.001, LRZ_DMARC_FAIL_NONE=0.001,
	LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
	LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_ENVFROM_TUM_S=0.001, LRZ_FROM_HAS_A=0.001,
	LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001,
	LRZ_FROM_HAS_MX=0.001, LRZ_FROM_HOSTED_DOMAIN=0.001,
	LRZ_FROM_NAME_IN_ADDR=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_TO_SHORT=0.001] autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id VrpfKZMu5iol for <jailhouse-dev@googlegroups.com>;
	Thu, 22 Oct 2020 19:58:49 +0200 (CEST)
Received: from kabal.ads.mwn.de (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4CHFV05847zyZs
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:48 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 33/33] hypervisor: Makefile: re-introduce -Werror and remove -Wno-error=*
Date: Thu, 22 Oct 2020 19:58:25 +0200
Message-Id: <20201022175826.199614-34-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022175826.199614-1-andrea.bastoni@tum.de>
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=l957Ha9F;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

Re-introduce Werror that was temporarily removed in 94ed4d4d1a30.
Remove Wno-error* and consolidate the CFLAGS warnings.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/Makefile | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hypervisor/Makefile b/hypervisor/Makefile
index 524653aa..8e3f946d 100644
--- a/hypervisor/Makefile
+++ b/hypervisor/Makefile
@@ -26,12 +26,10 @@ LINUXINCLUDE := -I$(src)/arch/$(SRCARCH)/include \
 		-I$(src)/../include/arch/$(SRCARCH) \
 		-I$(src)/../include
 KBUILD_AFLAGS := -D__ASSEMBLY__ -fno-PIE
-KBUILD_CFLAGS := -g -Os -Wall -Wextra \
+KBUILD_CFLAGS := -g -Os -Werror -Wall -Wextra \
 		 -Wstrict-prototypes -Wtype-limits \
 		 -Wmissing-declarations -Wmissing-prototypes \
-		 -Wnested-externs -Wno-error=nested-externs \
-		 -Wshadow -Wno-error=shadow \
-		 -Wredundant-decls -Wno-error=redundant-decls \
+		 -Wnested-externs -Wshadow -Wredundant-decls \
 		 -Wundef -Wdeprecated \
 		 -fno-strict-aliasing -fno-pic -fno-common \
 		 -fno-stack-protector -fno-builtin-ffsl \
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201022175826.199614-34-andrea.bastoni%40tum.de.
