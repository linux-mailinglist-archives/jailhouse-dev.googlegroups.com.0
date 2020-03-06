Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCUTRLZQKGQE54LD3ZY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id AB55417C482
	for <lists+jailhouse-dev@lfdr.de>; Fri,  6 Mar 2020 18:34:03 +0100 (CET)
Received: by mail-lf1-x13b.google.com with SMTP id w22sf1102574lfe.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 06 Mar 2020 09:34:03 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1583516043; cv=pass;
        d=google.com; s=arc-20160816;
        b=wcL9w5X02P6ccNo4UXViDc+trdGymSit5eVtKXI+Yyp+BvAlXfQimDAX0jMhZAIRNa
         18DBscC/RqPTwq75AnF25UEb76A8FbRn2gMLTKY21QQ4NsaP9AVpVS3A3u54mJaJ1ujn
         gxQjVwaDl2KyjNC6RhbwQsUW4+yqXgF2/6VJyIj/87JY2jtdsQQzHBux/NB2yaJvx3Hs
         v8eT8xNEdCvfXSJD2gd3kd1/FA7622WklLla19JuQZCPA/ZWLHbOdECT7CP7JD8wC6ud
         bM4VDbuBLQhULm6iQixwk8xmAnyHePV4rBrdo+OE6V6rkOpUHuwaxE2ISTwTGalmz1bJ
         ZQFg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=R42qmMHBJ4hIU5NRI9dh06ixRtHH4ww4mamfAu2T9xE=;
        b=ecbPfZzoOLLpFtFU7NCTsRhsgH8LSeF01hPGpT375donTNnmd4RTQIUewP+PZnSGnl
         TNt+JDB3MHjRJ3MDCKVOhMpsRy1Q7F0cWUam8esomXEp0K7hTLmkF+pqmXZ4/waoL23M
         OhGhiQVi2Oje2EZYELZ+S1lpOIvA7g/Z2ICreFOQbilapsHdRHLmS885HKKa4sYDRI0g
         OAMce0UzbYtn5lf+RSW7GQso+qwqfuPGZL4k6/pa/KFL+NTFvV/Z3CLM43Uie/R0+38R
         2+ipdy+vZSiaGyuEYGyJtVzN+bp5LS04NVa2gU8nBCLPZTKJKpB2X7f7d4uuTziPoxP7
         vp3A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=R42qmMHBJ4hIU5NRI9dh06ixRtHH4ww4mamfAu2T9xE=;
        b=fDLs6aLrVjx535jXPTlI/yDwZNAGImatRMbSTYsruuBA/swRr8D3U9VacEEQbWTDU1
         vHXNR275mYWDqMBdZGw4ErjDfVVduFiEy1hiWuffp1cNq3cSTLzpPnkxyPngR15sNfHB
         Qgi9JpdkC8DQolc+IPPLEtqL/mA+SMksu8EdcIz5kwheN7FA7n1lhO5LxpQpF7pPHkrU
         cBCTPBX/4mVIuDQgE1iN2zu9PyLMDoIRoex5KHEA8BbKyKYS2dDZaNPF6zi0RTNK3eBZ
         yhyWpa7CHbgOZcDhnHridurMBRVcNoXLn4p49gj5QddX9RbFhPRtiOMNy9n3HhYOE2Ge
         j2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=R42qmMHBJ4hIU5NRI9dh06ixRtHH4ww4mamfAu2T9xE=;
        b=TSWPm28GTBvJCLXiTWLvbORJNzIw/UphXi+LZ2ZPgxf/O3d+iu5YF/OhQU4Y0+GrQc
         O6D6iUoNFDbHjrGrp3eSuOuISllZfvkbiIaeb0Dn0+T7sX6F7RTgVPZAy2aSssR9wqVs
         61Xd9SfG/bzSHMlx7M0dn+WJGKQJH7inukJa3HUOjfTatZMOYZq+3zVJCcZ3VLaEkwSW
         qYWFnc4T1uJLseN3+QO+H6N6bC22a0x16qr7nB83PQ8Dzakp98XZjVv/09/OBGkVOt8C
         B66pn/5cDPgqsShTD3GYuSr7YS2Ez1mPAa/16p3Uhn1y5JyXcch5/AjiwVqya3P4EVXd
         WOMw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ0YLehA5BOJRTrk7QLkCjUF0AHqyYMcWe0FoHfhfI0P+e/nnXoX
	+hhNKl3tmz9UL108H6G+Cpk=
X-Google-Smtp-Source: ADFU+vvugXw8/RxmcotRYa/fweaOzt4Y4I+GcPpoG/UgQ5LebS742yL2w/9nPr/G/LpFcu0iHz+Elw==
X-Received: by 2002:a2e:6819:: with SMTP id c25mr2719647lja.16.1583516043175;
        Fri, 06 Mar 2020 09:34:03 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:a58b:: with SMTP id m11ls629327ljp.0.gmail; Fri, 06 Mar
 2020 09:34:02 -0800 (PST)
X-Received: by 2002:a2e:b54a:: with SMTP id a10mr2851702ljn.47.1583516042087;
        Fri, 06 Mar 2020 09:34:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583516042; cv=none;
        d=google.com; s=arc-20160816;
        b=OkDd+9nruful0djqgYO6ujFnfTKv8E6kuK7cr6H7Th0G3YaEO1lyT/zw+pAASvIA5Z
         WnVMwTwwOUOUW5LFiy+Dzze6a/yT7k+bvCWiWkwuWpF8xMlXRHviFt1EtwdTUKYG/Y1s
         CkT70lz9nTwSZhujQsU/n11uiGhZOe9UReD0zodZf2dGuQkmOIvWe0Edbviswaw0dqwY
         dYOy6CfR7dagrjGdww2KazDYIDp4ICdcKQDj3sCMwOK8sBLXMojQ0JJcoUP5Y12yw6rD
         RH6mldVPBBfS4DvJJKupW4q1TbpEya35QiKRZ3dsxlgqyv5h/anfvxd84gAw9ajaDwqO
         7Eow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=NmTZ+ypKCvYLkERSj4jxTRkkrgqcgK5PvtkmtCdAscw=;
        b=lLaxEgwKGa8jxTBwF+uaczbbSsv1gFAoVfu8HqPlQoJm5A91K4fCLJNEisiQdtb7vI
         alK4O/ur7ipQF/r7FN9KHxrFLN7/fghkvYDDW2QzsiJMNHpDHVdaDJ8lnwNIS6SbbIZH
         FeEwvuothAlcPo3gb7QbRVkBRXERl04pGWZvHmRy2wYAazkz5z82/sbwvtVff7fubbUQ
         JPz3UiFzxkV4qcRZvZzjZ1Kc6YREK01xEHmQR+XIxiGsNYQhECL7+TE91EawISErFGRk
         FgBJ6fXCgnv4tlseBT+itaQSxZMT0c75Hg+xhU7WlxEjvzWF3X1Zvfbjiur+lBZDeVAt
         UdpA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id v17si157103lfp.5.2020.03.06.09.34.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Mar 2020 09:34:02 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 026HY1j2001003
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Fri, 6 Mar 2020 18:34:01 +0100
Received: from md1f2u6c.ad001.siemens.net ([139.25.68.37])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 026HY0aC016750
	for <jailhouse-dev@googlegroups.com>; Fri, 6 Mar 2020 18:34:00 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 6/6] Documentation: ivshmem: Require that doorbell writes act as memory barriers
Date: Fri,  6 Mar 2020 18:33:59 +0100
Message-Id: <368ff6b2acb3f24ec5903db328d73f2c9d986601.1583516039.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1583516039.git.jan.kiszka@siemens.com>
References: <cover.1583516039.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1583516039.git.jan.kiszka@siemens.com>
References: <cover.1583516039.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

This avoids that the guest has to be aware of how the doorbell interrupt
is internally sent to the target CPU because to add the corresponding
memory barrier explicitly. The implementation in Jailhouse already
fulfills this new requirement.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 Documentation/ivshmem-v2-specification.md | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/ivshmem-v2-specification.md b/Documentation/ivshmem-v2-specification.md
index d93cb22b..81ba300b 100644
--- a/Documentation/ivshmem-v2-specification.md
+++ b/Documentation/ivshmem-v2-specification.md
@@ -314,6 +314,10 @@ selected protocol.
 Addressing a non-existing or inactive target has no effect. Peers can
 identify active targets via the State Table.
 
+Implementations of the Doorbell register must ensure that data written by the
+CPU prior to issuing the register write is visible to the receiving peer before
+the interrupt arrives.
+
 The behavior on reading from this register is undefined.
 
 #### State Register (Offset 10h)
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/368ff6b2acb3f24ec5903db328d73f2c9d986601.1583516039.git.jan.kiszka%40siemens.com.
