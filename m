Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBGFVTWCQMGQE34UE6WI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x103f.google.com (mail-pj1-x103f.google.com [IPv6:2607:f8b0:4864:20::103f])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E59238C028
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 09:00:41 +0200 (CEST)
Received: by mail-pj1-x103f.google.com with SMTP id ot13-20020a17090b3b4db029015d9ead4bc5sf8039619pjb.7
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 00:00:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621580440; cv=pass;
        d=google.com; s=arc-20160816;
        b=FFfwo8BV1cVzPsbeL0zInBU6j3A36Hs+NC2wXhuPKt79JfjTScbCko2uzO24f8sxoc
         0X6oWtFtrnf7a+Q0OomiSi7d/deSIHqAwgQCa/lN8X3mcdWNjmWNNial4E0g2qxlVAOB
         MWYY1g16bLetw0vGlncNqZN3CDHg4KNgCMLdfDjvY03MYHMLWV3Hb/jQLAuA0AORoBBf
         taUWsat+0V6/riZxqZ/Pji288SLswsaWGsNE7e6Tmdm8i+tdQlB1OSXJsaTsFc46dvdR
         wGF4CVS9UgjZkZSNQtWWPYZ9lX7oaZRcsxBwZ+GUVEy2U7jxzRL4WpCZFgKppajpl+0k
         pJYw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=xdzSJ0BgxLtFwhQy6cgfCqebteXKn1aYFqRCLiFsnXs=;
        b=J45Ow/2fbaAolGFZVWvh5THhIVbLhez3ud5HpVDrUQZccfAjlyIDMnRN/hDF+h+8bH
         H0lhMA/Itmuoa7QTPmjI6v1qVb7aydTkId4lvFq57nQMiq68/frSCfNklrWgml7EJ2to
         JEdhJwgq14jSHGJ4yECuaFA8N9Je5xVSyFEeMQG5KCPTdclvddze4qb1rvcPoldp0wC8
         z0IO3x+DCswaLv/TSixhnxXyi3iNTirY28Q/VRwyCC4XCKyIlpRTd5Y/13e+8ntY+Cpa
         dYWKLNy2lmjB+HBABTPHBcggODDh0NNSv/aB4ywlTKj1v3iPql7cqGpegQMF9mfmo0f+
         ImxQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@github.com header.s=pf2014 header.b=1Qbz2Lzz;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=xdzSJ0BgxLtFwhQy6cgfCqebteXKn1aYFqRCLiFsnXs=;
        b=A2QCGv0Gp22daGZW0vijhMNljCYCDt+CPP3CKMPlPYaWmPG7DEHlBhADKkcnUcYYBu
         KOv20lBREaEwe0F08cmj1j7SUqzy3ykwycPWLH7i8S3n9HZi80Gr2HgyapLqiNxWSk1s
         GBvOy72S1R1j5ts5kBWbmG2XSAtq8Xrs187Y6tjGsWHbuuQeoO/oJpEr5GXvff799SEJ
         1ew/bKicVUgVESPmFepfotYvQxAWCaLs8OgQDxvO5zPufmfnBaVef+OI5uhJmoWeiQab
         2FC77xN/YD582H/5+6cPQRH12ys9x+DVJ5naYpqQVfGLFEvbUgmoSSq7Yw/uHMW9xdRy
         upjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=xdzSJ0BgxLtFwhQy6cgfCqebteXKn1aYFqRCLiFsnXs=;
        b=RWLEraxxY8SSZkPPwb73bPRHXz40wbtX5OhzQGGfSz3eJ0PwL1QDvoGZzBM08V2MQB
         sW3ktNgsl9rWatkPtld/CvTnb3iZB6nwVjoo+llYkDAW6KZLffikdgG/D0vMh0obzg1H
         kowqabG/xt3qk6nxvWevYos3VMqpWZeEjhswAozN+mmVyPtrDymlzARIv31L+3HZ1GeK
         JrsMnJ0I3qAQdAsT/4uWEl6g3px/xA7AC+6052EA5cRsISCIgPk68+ic2Qa5llXX89d7
         cgI+N2C3R/C7ld0S4e47zo6WeClFCo/XWrqhDDucVNuw6tv/KBc4h36idE5R8AAFndOu
         DtUw==
X-Gm-Message-State: AOAM531Kj2KDJyHe0KA4aHQJpfxz4SZHG9Rlom8unkH7u+ZEK+rtRgaR
	vWOZUNvJViB9IpROop80XEk=
X-Google-Smtp-Source: ABdhPJyciJQ9anfLzjJw47CdMs3S14ow5oguKH/cAlLHUcRkLwyT4rLP8LbjNjD/rAe2HfUYQ9qOwQ==
X-Received: by 2002:a17:90a:986:: with SMTP id 6mr5330573pjo.139.1621580440285;
        Fri, 21 May 2021 00:00:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:8d95:: with SMTP id v21ls3459334plo.8.gmail; Fri, 21
 May 2021 00:00:39 -0700 (PDT)
X-Received: by 2002:a17:90a:2c08:: with SMTP id m8mr9407850pjd.163.1621580439663;
        Fri, 21 May 2021 00:00:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621580439; cv=none;
        d=google.com; s=arc-20160816;
        b=qYWnIsLfMUjsEuu7Qp9cZraLqnyDef7b1Hd4Ju/Mwl8sCf2iWWh57QsAtnDGSsZLpv
         3SqPRSyXV8Yf2nuLwHg1yLXxGFvpE0zJPzF9l9zIAl2wLtqz0y+rXrjmIK99MYiMhSxO
         E70jhjQ6WYZLrKx8fFeH0wHIiDMcsKJUVIEjbrwTDsXkDDcPob69Okp8WmWWhHBXUS6k
         cXKzcFTAK0kXMsm9tuhPzghauBWOmnaQHAflMC2WyetGqHnl+GrOJH6gDS4xDTQlHalj
         2W6EjomcdHuzuZJUgeadkdwN9BXFQg4VKa7RIioZyujxe7owCyWjE0ecBLXOtGfSrrzs
         OiRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=YAup3fHh1HdMw5HsbVo/EM/+gsnnIRaPyniIW2vE3N0=;
        b=fv/xKJrUJZgVgL+H2CFDsm8ATCE2eVptiHYOI/BlIRRBRkeTkR+rEgpE/pMoqf4oM4
         QwXzV8kNkta9WKn4KpZvxDzTwrWdHV187pmRXTz8Xa1RNDS+aSH1czriWJwlFbX7Ak18
         Fx/YXBAUsOSqRfbFSgCB4XDBmwjJ1nWyfnXk+tGmLXa587pTCWMynSrAasKQRoHX+AnT
         f2wqmJzRXgaZZDYXdmvLXtMdXg7gBkDory95ISSZI2oauwapy4zwI2/yerhIeE80Opgq
         fZsavCOvhdtMBUd1hcc2GRTR0c5qnOWNwDZ0f102/teKDYAkJ7quacF5gxkxwwEPbMro
         yQPA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@github.com header.s=pf2014 header.b=1Qbz2Lzz;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=github.com
Received: from out-19.smtp.github.com (out-19.smtp.github.com. [192.30.252.202])
        by gmr-mx.google.com with ESMTPS id j17si598296pfc.5.2021.05.21.00.00.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 May 2021 00:00:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) client-ip=192.30.252.202;
Received: from github.com (hubbernetes-node-eca2a18.va3-iad.github.net [10.48.204.22])
	by smtp.github.com (Postfix) with ESMTPA id 2AE41E0DC7
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 00:00:39 -0700 (PDT)
Date: Fri, 21 May 2021 00:00:39 -0700
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/87aa37-e0ba79@github.com>
Subject: [siemens/jailhouse] 95cb81: inmates/lib: Add zeroed alloc, and update
 usage
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@github.com header.s=pf2014 header.b=1Qbz2Lzz;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.202 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass
 (p=REJECT sp=REJECT dis=NONE) header.from=github.com
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

  Branch: refs/heads/coverity_scan
  Home:   https://github.com/siemens/jailhouse
  Commit: 95cb81c355584e2a6a81b5d42154f4c7555d7644
      https://github.com/siemens/jailhouse/commit/95cb81c355584e2a6a81b5d42154f4c7555d7644
  Author: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
  Date:   2021-04-20 (Tue, 20 Apr 2021)

  Changed paths:
    M inmates/lib/alloc.c
    M inmates/lib/arm-common/mem.c
    M inmates/lib/include/inmate_common.h
    M inmates/lib/x86/mem.c
    M inmates/lib/x86/smp.c

  Log Message:
  -----------
  inmates/lib: Add zeroed alloc, and update usage

Adds zalloc(size, align) which allocates memory and fills it with zeros.
Replaces usage of alloc() in inmates/lib with zalloc().

Motivation is that use of alloc without zeroing mem.c:map_range()
results in illegal page tables if memory contains artefacts.

Signed-off-by: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
Reviewed-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: e0ba79023af9084aef86003c97a91b705e3a7c5d
      https://github.com/siemens/jailhouse/commit/e0ba79023af9084aef86003c97a91b705e3a7c5d
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-04-26 (Mon, 26 Apr 2021)

  Changed paths:
    M tools/jailhouse-enable.8.in

  Log Message:
  -----------
  tools: Fix mistake in jailhouse-enable man page

Reported-by: Dr. Johann Pfefferl <johann.pfefferl@siemens.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/87aa37d4236d...e0ba79023af9

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/87aa37-e0ba79%40github.com.
