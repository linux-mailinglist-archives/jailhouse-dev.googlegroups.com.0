Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBXWBYHYAKGQE4NO3ANA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-xc3c.google.com (mail-yw1-xc3c.google.com [IPv6:2607:f8b0:4864:20::c3c])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2451301AC
	for <lists+jailhouse-dev@lfdr.de>; Sat,  4 Jan 2020 10:54:39 +0100 (CET)
Received: by mail-yw1-xc3c.google.com with SMTP id z7sf35920771ywd.21
        for <lists+jailhouse-dev@lfdr.de>; Sat, 04 Jan 2020 01:54:39 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578131678; cv=pass;
        d=google.com; s=arc-20160816;
        b=es0rW4S5YkbcS2cObmz6m5jr67RsvgzZE46ikDgM5biN/E5b91UdDunDB9C4uiJfU+
         E5zZ5Hpnt1fXeVQG66flj0yNAnBg2ajYNZfkeu3zX6Dy+MC1TQZZhSUOx3aW9Fzt68L1
         9bxau3BYSEgmBJegAgYEKGyg2lCrCoMhA5wLJ3yMKvok3sjNYcTkpTD6kXUGfR1x63m1
         L7Af7FLq5lQEIXOKpBprLA1QDdhrrQBjq+9AGy0tUtXXW59az48Rsr2/QUw6ooJjRz7M
         dPvmUuw3id+fRtd5e0KaWW2b9iOu3DTw4IktpwHk7wZMFtniuPMKgS1WtuXBRTLVX7Pp
         cjZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=LwQ9k5fE0GhWwmIsLjLgfXnb5E3GsLcSJRxf+yTp4O0=;
        b=bqJKaGc4v5oSJRYhY7W/cYloSqKJUwtQZnY7g+uWZ3x3cB8oLjV8mAd2tCogW/0XH0
         Yy3UFAzrBWo/HPlRpQO4l716EUrUURLTLJT0Bt1PaMJAzRsTgXjSY3sCW7KtIW5HPrGr
         JlB/5wA7XKN9J5OZPbx2uCMwaj3andsa1BIOpYPChRUkLVDPkGHovyET5vZjTqeq6Nty
         G0SKaVyagOI0lpTCyUU387lJgvpVmEkJnIjNpjqS9ly+lbNI85VAIgpBw/wTyvlaqL9N
         GCP1nZWZKhNlHGztq3ZE0tYXcbSosfZoLyGM1aHgTiEz7R600pWsiY1rfAgMpQ5ZT+cz
         /mKg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=NsKkcwJ8;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LwQ9k5fE0GhWwmIsLjLgfXnb5E3GsLcSJRxf+yTp4O0=;
        b=tcf/F0TuQuDGBHaluAgxZ8krhAQ4L541j3U8QAl5vQscWjiqEE2JCj5XxXKil5EpmU
         sLsViMANKSVy7ku6L+DO+O5KiAf6IsADAlc6hafpJINvGGrdDgqFz8lvCQ3LeCkxm4vS
         e9mwEmaqpnqrCVSyrO/tvhX5+mlOeA0DNr6J4mQjoEoCQoo4Tj7iz5mHXksX0Mnqt83L
         o2M8bhdFSK6FW1BRy35tsiR6811m5rnkfA9Ua9+hJlXCyYay8qRJlTFqICP+fHRkHfWU
         9zvMvgYFMA6No2dJ1uT0uiUSitrwxhpK0QYB5O84HshQSlPTB4ZYZeoXLlTXdic/JmCm
         7GUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=LwQ9k5fE0GhWwmIsLjLgfXnb5E3GsLcSJRxf+yTp4O0=;
        b=Nszm6agH/wgy6Lbgcjilk914Nfw5sgrTB/mwNsWj52VAlDdWqSDl+GVz6/381aLC+i
         lgHveuG7DIF6XMwTLaIOZzrKIFeqeIazRHZgzB6fiC52qxKZIe7gBTqcpYn4V9kHJZKR
         PiK8G77b8pUpedKv/WGSN9LgGrIu0qW3NSw+mhekKX5BWcli7VeJH+1ddSufw/0IJ5MT
         XFnXNLbAChcO4sRayMvONXyTpeeJfgihHtUZi4CWNOPqnAYcio6A/FlKibLzhv7qkm+8
         1iA11yDWooKYMGSkdjwbKX3qTMbAIuK2eBjYknvcWUwXOerZgsHvB7419lMbmTr6WObo
         o0aA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUoxAeH63O7f8BE5/4qVryh6QyEumkIAnvWBGZ1AGiJ0G8npFBE
	WnrbRI0bcR49jFOmmy23Cl0=
X-Google-Smtp-Source: APXvYqw7SA1yCaOooOraiRX5HBRR7LqlKf2iLcUVMGhGGS5XtaB0LG46PjNcU2F5mXtAKQgjfGeKFw==
X-Received: by 2002:a25:a446:: with SMTP id f64mr28342069ybi.240.1578131678287;
        Sat, 04 Jan 2020 01:54:38 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:8488:: with SMTP id v8ls6913985ybk.14.gmail; Sat, 04 Jan
 2020 01:54:37 -0800 (PST)
X-Received: by 2002:a5b:b4b:: with SMTP id b11mr54303086ybr.337.1578131677713;
        Sat, 04 Jan 2020 01:54:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578131677; cv=none;
        d=google.com; s=arc-20160816;
        b=vsmqYRPArIBq0iXWYAzMZQAxlzunjoiX3p6qhlCeTPCynyXx5r/td1Xoo65Z5vAKlg
         GnPGca89lCH11sx+ylklVrbIG911mAZzE5TktZii983XRg5CXCFNr7KCcJC+/nmH2i/6
         kTZgvHZW/9LrMUMuVmQr5TCmx9EIgdM0WsFIFpYs2WQMvHh8VRaIh7GB4bYg1YiHemGA
         TSIfjHlH/mKN8FlPZ1oSPLqy5CnNCDaLPAmkIvOZJDx+dWVQORQapIuYCiGlH4birAvK
         jMODUBK0YCM2fB/FLLGXvZyeReSIBfN63fjSok+WQnDAht+/uOAkvmWKccHkfDFw36PB
         7XWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=4gHdXa/PY+yhLUsYDtBosDpMvEJ4FXJfGOsP8pAL9Co=;
        b=zRd2DTX3tkYa3gByxEpBXhbJhKJ22isNJhHhJPpbMPWWjzoS6md5QwDvaGBwLdtE1k
         0tAgSh/bA+iVi4lGmknboC14ZMs9XcfoHZ1UImbnnJbSfojiywmNjk8G1Gbk5CYeGJuB
         wbF2dxbPNEisPgpvlH0JC76MAUF6kB6MQcEX87eMsdgmtfOL9hcMc7kBx86IvLfN4I84
         HLwZgUUwru3D21ViGsQb25RpjChnC3fvYIjYnHlRD06vPeP2IyORID1JKqHLiliHsgnw
         df9bX5ihsLCezImeNVxFasVZ9lyKySEvOIbfPANqdJQ3Hn9zNzF0y9MVtp5/Yc8bUTnS
         V6QA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=NsKkcwJ8;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-19.smtp.github.com (out-19.smtp.github.com. [192.30.252.202])
        by gmr-mx.google.com with ESMTPS id z5si2491907ywg.5.2020.01.04.01.54.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 04 Jan 2020 01:54:37 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) client-ip=192.30.252.202;
Received: from github-lowworker-2e54e43.va3-iad.github.net (github-lowworker-2e54e43.va3-iad.github.net [10.48.17.27])
	by smtp.github.com (Postfix) with ESMTP id 71BC25201F8
	for <jailhouse-dev@googlegroups.com>; Sat,  4 Jan 2020 01:54:37 -0800 (PST)
Date: Sat, 04 Jan 2020 01:54:37 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/ef318e-a833fe@github.com>
Subject: [siemens/jailhouse] 463ce2: tools: hardware-check: Add tests for
 INVPCID and X...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=NsKkcwJ8;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.202 as
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

  Branch: refs/heads/next
  Home:   https://github.com/siemens/jailhouse
  Commit: 463ce276e37eacdfe534afdf96ec6902ab6db39b
      https://github.com/siemens/jailhouse/commit/463ce276e37eacdfe534afdf96ec6902ab6db39b
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-29 (Sun, 29 Dec 2019)

  Changed paths:
    M tools/jailhouse-hardware-check

  Log Message:
  -----------
  tools: hardware-check: Add tests for INVPCID and XSAVES

We need the corresponding features in IA32_VMX_PROCBASED_CTLS2 when the
CPU has support for those instructions. Add the missing checks to the
script.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: a833fe2209568219e363487a83fb2aaa0a088342
      https://github.com/siemens/jailhouse/commit/a833fe2209568219e363487a83fb2aaa0a088342
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

  Changed paths:
    M .gitignore

  Log Message:
  -----------
  .gitignore: Add new .mod files

These came with kernel 5.3.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/ef318efa0a1f...a833fe220956

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/ef318e-a833fe%40github.com.
