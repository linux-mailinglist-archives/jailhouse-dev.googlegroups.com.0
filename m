Return-Path: <jailhouse-dev+bncBC76BKUBWEKRB2OWXPYQKGQELTAK6FA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33f.google.com (mail-ot1-x33f.google.com [IPv6:2607:f8b0:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id D56B614A57A
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 14:53:46 +0100 (CET)
Received: by mail-ot1-x33f.google.com with SMTP id h13sf3411413otl.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 05:53:46 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580133225; cv=pass;
        d=google.com; s=arc-20160816;
        b=PADCy1fBH1itdxLjmTSHii+NqdQRt0GqmE9TLWFCwQTPY1QD/Ll8Jc+Es3EwX8SyVI
         s7KNN7GsuPJERxSgjPI9SwarGp+NXbG95uLeBwAWmg/dlpKrwFd7Ir4Q/ii7NhGBvArK
         QtYuljomNb5qvtO5LBpf4kGOGcZsIFlZhcibOCEgR0FYqCPmfU7ADHrqOIW+DOLTnyjX
         jxxy2PxZcsqpYwg7MhcbDqyMtCY+czsrapg3LwZugw/9+DhLwzTRAdm6eF+h6Vgyg6I9
         O61RtvOcxLJLtrjDszaKYxbwlh5mj+vHEUcBnE5LQVABu5SPG9iD1pknXe0dgDzqJEW1
         TPRw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=+Zo1RxHuqWWcka3Nw62FoK1adtEw/oj9cFIDmby+0js=;
        b=p7XkEpybkFa2YErPnQBZc1/mFJ5BBbrZgkmOCbN0tjzxmsnpnJa7MHXZzwV+oHZVVQ
         Pf3fys3urDttBPd2+t/CvtGlPmTn89a4Em1J94/L6oEggsNqwitNiJ2L1EOC0D7NsE+z
         snhs3xZuHfMwU6IXd825YQeIYnsjjl4GI7o/u/bsUVbJh5XGossdc55v5ZPK2N0fT6fB
         xGEYbgkUvfETRU43dfv3r1QZzkZgvw4E2JRuxGMFbGrTe7uAsLCEOw7fm34x1LtuSwtm
         TL4o86pdJXNqL6JhPrGaSHZ2LP/xrQQ5d5EoVQP/8F+1Ac7mOqOwegbPvzb6Mnyk3WDD
         3Cpw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=PavNE083;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+Zo1RxHuqWWcka3Nw62FoK1adtEw/oj9cFIDmby+0js=;
        b=Gooh/I7n+5xPJI5YCuLhivqTQOWe25z+CLQHFc2sURGuZIu25YUcJWzgiVhHjr8DdA
         1Jj0yozfvJnizjkQzBNGPcYLjdD/HUrs5N4TrW0DCismQRQeNbK5jc/PQWwKu7XWQPsS
         wgxJ2nkgJTZ3gcx3C9QhvUUByXUaYhUdg2mayK5z9o6eOyy1Q9tcdjPt3MisYWL498iC
         7iWYPsG8KQP8YmOR1uTs5U5vLlNiEvTpmSBatp3ALNPzqa3EWjTR4QPPmbFnbDN4CE63
         kuwloQqAmVfgvySvIvGmptAlxuJqcAyBpNsJr/KXL2nik2bMO8B4reDbEFcA0ZbxFPwd
         VH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=+Zo1RxHuqWWcka3Nw62FoK1adtEw/oj9cFIDmby+0js=;
        b=omWi+tz9goe1PPsermyISiC0frXn1jApKGVJ6NMwAj7D288hQsmBaYi7VmEA8zJd5F
         ScGwGa5UXS213QgQQhTIocgVPOWaHqWtYbDp9I3PseiwgAYsYPoZRoawZjuSgU25omth
         Q0B2+YN1xLyKg/r4wv+x4YE0Y3mM56iwC9hVGLi9IG2m+0TX+zzIVSyKPdc9T8EvOYIv
         J4vFDTncu2s2m6xn9jo0nUVeMwuabFeuEh65bs0Ai+K4J51aGD3g+vsmhNLnGesUTC4e
         5jG9hIc8FrJE3Sj8YxAWfWcr7sHbxXTLEuA11e86eg3AOClK5PsmrVWI/2IPeV9aw1tC
         c2lA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU0Od/rsMUMmQZkamAEJ9FL9vslpwbDiyVZvaZqClohl0kAHwHD
	kzWPokvksZLbZxODdCL79uw=
X-Google-Smtp-Source: APXvYqxqHxWgrCknS5DdELP2ehmEXGtSDC7z/va7SPFM37RzsUqEvKB2H8Qm/tRa+qgZem00kGBMLg==
X-Received: by 2002:aca:f10:: with SMTP id 16mr7074551oip.117.1580133225398;
        Mon, 27 Jan 2020 05:53:45 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:4604:: with SMTP id y4ls1447960ote.7.gmail; Mon, 27 Jan
 2020 05:53:44 -0800 (PST)
X-Received: by 2002:a05:6830:4b9:: with SMTP id l25mr12788231otd.266.1580133224801;
        Mon, 27 Jan 2020 05:53:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580133224; cv=none;
        d=google.com; s=arc-20160816;
        b=orW7RM0HIL1B32sBAhwwDN/HVi89hOp81/d0/d0L82LFudqiHCz5O4LVYdInUJkS0T
         59Km7K3a30G6zeU6R4p2okDwKBvKYi2KT4Sb7sYxvNUaZ7ubkKzn6Q6anlQsUtmBD+hP
         /GsxNxmKFXXrNO755jsioEbt53IaDeaqfFeY7Viu24tIPMnZd+iuigWB5jbiuYORgTez
         VUNKN7nn870149kwcJ2kVO52oDmhj+gJrs9EdOhyisq4HJWRV0lVue5/LBv7NXR+fEOj
         HPCUtbm98umRgaXRsoyIM//2dlreYCuas7He30W9pyDUMkoi0bT0MkpH+aHPqzW5nWtr
         SkGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=ksWDK1KjRPVa7vn6q4bMMeqf8Pw+5tYo63XZIntfUj4=;
        b=SQztAbzR2gCJhj9blcc3mWPlLDqJwTiMjCjrHvz3/CphAhmnxxPWB4Du3sF+Ua41Ba
         zJq+vhNYKiwxIYLEFpBqZicpGDtEP7UzFMfgxyeGRG2xoQWXvpiTBXBpoMP8eKyWPDCF
         OJnqMWZg6Ju6aiNzI7PzqWRdt5z1elMd+Zh9wpFp2hbSYVWqeZLSKfdyc+JDwL4AbxJY
         Dn5gzsRi9eJcN9m9kYA53rc9L5kUSHZM4mdb8ynEvX4VT6SvRooyH5as4LQhvNSGCZGS
         oQMVAVsPmmIFL1cWKdtCOkMGamM3rnUiWrlE97+eiBE/zM4rR0Pnsz5K4ZuJcivL4rMU
         DjZA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=PavNE083;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-18.smtp.github.com (out-18.smtp.github.com. [192.30.252.201])
        by gmr-mx.google.com with ESMTPS id d16si459956oij.1.2020.01.27.05.53.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 05:53:44 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) client-ip=192.30.252.201;
Date: Mon, 27 Jan 2020 05:53:44 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/2c8fc1-77a41e@github.com>
Subject: [siemens/jailhouse]
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=PavNE083;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.201 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=github.com
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

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/2c8fc1-77a41e%40github.com.
