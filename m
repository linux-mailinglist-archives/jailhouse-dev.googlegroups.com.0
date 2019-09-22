Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBDPVTTWAKGQEIEDUTFA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-xc37.google.com (mail-yw1-xc37.google.com [IPv6:2607:f8b0:4864:20::c37])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DFFBA198
	for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Sep 2019 11:10:39 +0200 (CEST)
Received: by mail-yw1-xc37.google.com with SMTP id l63sf9613914ywg.21
        for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Sep 2019 02:10:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1569143438; cv=pass;
        d=google.com; s=arc-20160816;
        b=nzKaMoE69wEiJOs9EjVNzvCbC2GJx9nG1wiNGggmvznxb7Uef2t/ScOvlzMywGU7Z1
         fYbP0T+yZSpX0cSRMbkSjxhC26ISWrCzdc94Y3k5A7OX/COZZmqvzoSTPKr8qKclvWk0
         O6yIk8hD8N/CVj7rbRPE/RvEpdrTuf/Fvv+wQzsQ/g46+wkGMvX5iXhFsAPMofSZ78O5
         Wn12VPhT5DWQzO1RfLkkjycNxx1UteBKN5WGQK/zMglGVmWnNS9eYUU41RdKU5JPiu3w
         M9G+DAvBtt0zn8BlxEcpTK0rN2Y6tlgO2OuwU0/40/XdibxjOtHafLFW3DfQyvqIiW7b
         mbTA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=EcJKhnhNDl1JpH3ko3EgJGAH49mpVgYvSyVYTKTOshg=;
        b=oFS9HELE74sZ60GWisTlabOAlc8/AcRxHlhboa6JXnFVt62gIgA53HUU2aJgxkO8wV
         XB98QndFYvuYQOuFK0ZLmX7dT2MhVnNeTzpsryZTwK9mjtQNxADSmZRBDa601mhWNpip
         wYeKr6Xwqglv0OsHzTuUODYxqxz7R8dFLN7+2RAyPqvzk4AeqWOyhHFsPn1e+d+PMoty
         ymnNzdv9NmH7WK8JeYEouXEe8HJrnyXeFT+FVDrYGRnEhy4zfye8eLWC4iLMv5OdShvd
         WFycbbpcDoMhUts1A5UxoDEVFWIowM45+qqCU0qLxrzOv8/ZbIAvp7mZZDD+q0YBe6jW
         zobA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=1XgtDgAc;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=EcJKhnhNDl1JpH3ko3EgJGAH49mpVgYvSyVYTKTOshg=;
        b=Gtm0lO8Dt2e1M89DjA0SEvJ8iFM+7ummNTiqp+iWBVbkmX05b8q9w2Tu/KOtL/4osA
         wm5aBnisxvyH6IhPFE37lNR5mCh7QKY9SRx8CC9Cv4/sKRS7ByuytvqUn3hePntxRxIi
         uzgFEo6P8OO0LwwuymdYh7nmacNIL1UgX64pBR6oog235xmbj2P76G+kk/N0DW9fopq9
         xwChtJBYJBue1NMXSipr4nW1tEyIgoZ/ir1z3MNvtnjhaE3Y4CE76KB169D+rltYVBco
         bLty+b4j8joascJ3CwG7ds4DthQZV2euQT3deHGC0nhUD+ppwauiTB8PqyOxWbU5Lx1Q
         f96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=EcJKhnhNDl1JpH3ko3EgJGAH49mpVgYvSyVYTKTOshg=;
        b=DqSM4BrTOg/REtsSO7dYtx7XbYx7yPbd+1eY9+TduUROtpFnIuFTfOCHi/DWVVAmd2
         NVx77BLxazw7bmUJkVCChkA+MF3Cdn68ALeM/Goh3gv5e6n6aAUSEpjrRvnvmJGkwG1G
         ibJI2dhD4oRfnKV/7qX452Y+FeWgcowYwA+HmK9NsYtGrGLHy9ihItb+aO6zszse91la
         YItUHl65motoz/dkkVwCv+NguuY8chV4+MCq/EnBMFaxWleb8ZTInFFKwUfcrwMdZGaA
         YeQxWKt+UEIYHmAO53wTSH1wap2uso90KNf2U8ErgcTVy6FFeu4TE90NC/YNf4Wtsk+4
         LT7w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVbLacdPer1pUrn5Iwt8Ky9/Kxn4NpdN6w5H2AaQUX19uciyT3e
	mxN6HXY9VwD66Ys/u0d0qtU=
X-Google-Smtp-Source: APXvYqwm3riurKrGK30djlTYVhWTVNRZZx4xOZvUwfZCNzP4+0T3OeVE8JHUT0EbW0knndtYu5bJ7Q==
X-Received: by 2002:a81:2983:: with SMTP id p125mr19236637ywp.317.1569143438314;
        Sun, 22 Sep 2019 02:10:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:4e43:: with SMTP id c64ls1900316ybb.4.gmail; Sun, 22 Sep
 2019 02:10:37 -0700 (PDT)
X-Received: by 2002:a5b:c47:: with SMTP id d7mr3007546ybr.129.1569143437684;
        Sun, 22 Sep 2019 02:10:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569143437; cv=none;
        d=google.com; s=arc-20160816;
        b=t4+6B63HVNHbzcygXXuzN73mDwM4YWjDayy0zfFoJBLRzLCIwPt6Wi4onmrFjw9AoX
         aXsYVaJvNBRx0jiw+BiMNsPaslRxNxO3xaGjAy+DDrdsEyS3WUeIY2S9ol44rhWIoA5Y
         N2kGWPOFyjnaL4PdckP/U0+1EGZ2OZ64nDbc/zF5ssG7MhK088apWW/fj0BDnYe5d7ss
         f/yG5uiAhM/QvoexauoYyOaA8zKGPiwdieDzbn61rBE4IjzmXCTCl6qdyXlenEK8F7CG
         HA0uRBVHkVSriakZhr6T2IYm6mLcu6J+oQAN603fccG5h42OyTMwozZcrSw2fuBuA+Nn
         RmDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=PvqF7ezauQqFvwcKAOIj0UV4ohC/AjDUj7nvrdAh2j8=;
        b=0kKtbWUD5/fM1Kzf7ZouLonomfqVOyXjqvMBBHPB4GM+9j0aX+5PlVHYsmZHZVmnaY
         wWJZfNEwW7zsYNtULKNmionZ/6t/8/NuaIeLEI7omU+B4B1TDIm9PVl1BsGZRtEqdFVA
         p/2qm0uKyQl5kTbh/+OZPwXZ3BCTITpK/hZpLyXkT1xrQilIf6D30Df9PwwDrEd51u1s
         TAIULnTpmo45S2Gl+iXMlCLbrZlspEtliqBYUCdq0Dxlg6j8lw65zWpT0DZd2EeK6JmJ
         2aVh0xUm1do1VwmwIL/WSyhcXc5UIkdYBUDDFzulpIj/4n2KKy/uMIKl/Mf25cMUDtOy
         xJrQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=1XgtDgAc;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-20.smtp.github.com (out-20.smtp.github.com. [192.30.252.203])
        by gmr-mx.google.com with ESMTPS id o3si419974yba.5.2019.09.22.02.10.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Sep 2019 02:10:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) client-ip=192.30.252.203;
Date: Sun, 22 Sep 2019 02:10:37 -0700
From: Ralf Ramsauer <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/de7a25-7cc0dc@github.com>
Subject: [siemens/jailhouse] 7cc0dc: driver: sysfs: fix parameter usage
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=1XgtDgAc;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.203 as
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
  Commit: 7cc0dc906976651c0a2f7561cadd8cb6af9ed707
      https://github.com/siemens/jailhouse/commit/7cc0dc906976651c0a2f7561cadd8cb6af9ed707
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-09-22 (Sun, 22 Sep 2019)

  Changed paths:
    M driver/sysfs.c

  Log Message:
  -----------
  driver: sysfs: fix parameter usage

find_cell_cpu gets a cell as parameter, but ignores it. It only uses
root_cell.

This bug never had any consequences, as this routine is only one single
caller, and always gets root_cell as parameter. Nevertheless, fix this
by using the correct parameter.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/de7a25-7cc0dc%40github.com.
