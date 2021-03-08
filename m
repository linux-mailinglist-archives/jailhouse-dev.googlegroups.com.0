Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBHNCS6BAMGQEL4PZEWQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc3e.google.com (mail-oo1-xc3e.google.com [IPv6:2607:f8b0:4864:20::c3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE5B3308C6
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Mar 2021 08:24:16 +0100 (CET)
Received: by mail-oo1-xc3e.google.com with SMTP id l19sf4738216oov.19
        for <lists+jailhouse-dev@lfdr.de>; Sun, 07 Mar 2021 23:24:16 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1615188255; cv=pass;
        d=google.com; s=arc-20160816;
        b=xP4DhtmvZ6SWLygN4yH74uhI4CH2z+yEtpH7mmXHo8GpSR0unWg+VZhmwcY5oLwVyb
         dceo7SUr4nl+pz27KAG8YUu0siQCZzzyLoJ2AYFGwFfCSqYfOxCF30WfW+/s0RrYu+EG
         qAz8yVp+eNTB87mkpXm3R7pi0koG0zivYTo1vVoFjLr9K4sGiNUsfdN7zl5nNbQPEeEj
         m43eV6A1EFLqDqirZzhXaZ1l1IMRfrAFqCfnFA4qSBmiTbw8VLk58MhM8gZKaKFvmKyS
         ehlV2AqrGJ20QEudaAsBGbk+AOuey+Oo/NoYDJkrtOAjLnXcrriMxJEQTBR6UyDMY8lU
         wzWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=xk+1dZ+MGheXCetrooHafsTqwdh/xlV722V4RjcGzIc=;
        b=IL/7gxjnF6doC243Ho1O43e49a5K5/8z+d+CPtfAQDUWEzAQJDg92zIUYGoKNxWdG4
         KE625ZSYtLAHdbJp3bXthw38MVygS/An9WnmBDnmdFdpiudE5yy/5RQiAxblWs7fF5lC
         SgTm43HbO2iYEwgjd74Q1TROhqBW4WbQfSJW8LdoJGMprUBgf2ioqZiCSPyA/e/NDKdI
         k4eQnY7e/YfBP4XHjJyoUDd0HmiB0gEfdqB9oGWZPtKT8hfvo3qdvU46JRmkESWX9CUi
         wPhG2+QVMafFep27oczGophhQGy7tGBwBVORO+PvrIim2vZ5PoNHGy+4sHcA2Zlonj2T
         lzJQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@github.com header.s=pf2014 header.b=vm26H1YN;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=xk+1dZ+MGheXCetrooHafsTqwdh/xlV722V4RjcGzIc=;
        b=BKDjAzPGpSwFGO0fHCOhqFH9Ec46ux0UCsVKv6dmtk5RCg3SNgErpe3pbyGVvP5vdq
         ae6nHr9RBopexdhZKbcqZd+Kc+6I003Day32j0yaAnQGvhSVfeVQN+3TLoAw6GYx+Ea5
         FJdn/Hzen/6wzB7q9W+euT2LtJXX0lLCvRdfdIOCWcTpEMysBklwAq1NnQ8QV8xYZSY9
         l1Zky/21gBne5p4xR+aD8e1B7PxZdSIZW76oWjqFfPcrUuJosxhISWsBPizRQgew/2xm
         k66lWl1MCMIT2jSM4TUKl7/MfWeP+S2vZ/Yl67DF8QQXd2BB8TMH665ilzAVPoOwXicj
         3mDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=xk+1dZ+MGheXCetrooHafsTqwdh/xlV722V4RjcGzIc=;
        b=GAkwuBiaz1XXJrLItvSzocRAdHrkoVGhwbosbO1PfUUBaghdpJltzfWZKW9Q4Qv1ST
         JEusizubqpSiZb3D7bAJOMmeTZl1y2pZ4TibfLHaY9o/xf/0QweaGe7oI+NFBe9Y1nYF
         KiNg0lZlsxbAKisdistEJaLzJDcl5/BSZTUZu+BEPUlFkSs+4ZFT9ke1wTISxCDzUOLN
         arG8sAxeYGn/K81PSWOqfGcsWmEVJ24aQwJ00IA+5q9nzpT10LVTmMYUW2iiTFvF14gV
         ktjn8S6pj5QTrkk5kKYjfextdaHwWcVq5v6Z5oic7LR5wl3Hw602ISvWVt6b7xhk4+hz
         ONbQ==
X-Gm-Message-State: AOAM53152HV9zlMZEtasKp2MOEqT+5s6vhyfSj6oi5VK4zDu1FbZqEy9
	OIOU7OW5t6JYZKf1YCP0tQ0=
X-Google-Smtp-Source: ABdhPJynI9SPW3EujSRupb/mzTyFqsQwCQyZ6vb8QtaiG2yrmMRjwzm9J6XdlK/kc/5S6+PRKtlKUA==
X-Received: by 2002:a05:6808:203:: with SMTP id l3mr5898110oie.150.1615188253979;
        Sun, 07 Mar 2021 23:24:13 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:6c57:: with SMTP id g23ls4316785otq.11.gmail; Sun, 07
 Mar 2021 23:24:13 -0800 (PST)
X-Received: by 2002:a9d:640b:: with SMTP id h11mr18219182otl.224.1615188253428;
        Sun, 07 Mar 2021 23:24:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615188253; cv=none;
        d=google.com; s=arc-20160816;
        b=us1PiAMnx0+vuqi81OcC2d55oM4gRb2o8aFbgnEB6QiJRqcuexkrWKnQO/Akrg/pHp
         8mOUsgfQth/z6tZy1VilAkv6ouDtUED6fEdccNqqWNHO7mmZDGWg39ZrV83Rnwl+roiQ
         5b1Xy5rHS7vIqXCFrSzj3fQMyv+rAuAmm/opnUzJmcP8UK3Ys3h/LpuyK4R1hAQ9XAYK
         uMJyin3Rm4pXDlP8ZhQHAU6pg/7Ji1x7nTOe3Jo1cK6uPVsJtkkBWKgCIM/fKDwh4uDC
         SKdKue5E3rfWmSKtiCdSnW/f9E31cF7lLOpYZlnvpCHlkZQaXpkFYOinsYZ8TgXj35Sd
         l+zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=OzGTCa5ucS0fUshluALaAO3h/c96O2lE2LMqvDDFWbc=;
        b=CbMoDy4l3b2ol6SpkAKviifOQ7Orj3rr8a0E6nx+Si7T2U0AkO0OvvjvIEeo1R+5OD
         c+ypzHgynMLIKeoJoDSK6ZDl1AaDjO06llFq6v94TaGi7FoVSlskuN6kxv7LC8uJ37bI
         WVPvi1gxNeYaMkMR7f5V2z0H3/Anc6sVj+ME54MsKqXE9F5bTJW+RtpOqdqAmV+VF4Yc
         xwhcz7GVoLnVPtT3w2cbfkj8Urvqqjod+l5QWeHjYS61vSccZHzlRoEnT/00zwSOSzU7
         tAjCfl8Dbw8aTwSp6gdEBXKOnMOPu1xQ5YWXYpm+E79fyEUkSVLxt9JqoHD6ok7TGNUY
         NpbA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@github.com header.s=pf2014 header.b=vm26H1YN;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=github.com
Received: from out-20.smtp.github.com (out-20.smtp.github.com. [192.30.252.203])
        by gmr-mx.google.com with ESMTPS id j1si961611oob.0.2021.03.07.23.24.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Mar 2021 23:24:13 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) client-ip=192.30.252.203;
Received: from github.com (hubbernetes-node-d227d2a.va3-iad.github.net [10.48.123.21])
	by smtp.github.com (Postfix) with ESMTPA id 03711E093D
	for <jailhouse-dev@googlegroups.com>; Sun,  7 Mar 2021 23:24:13 -0800 (PST)
Date: Sun, 07 Mar 2021 23:24:13 -0800
From: "'whbo158' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/master/b91751-6c0978@github.com>
Subject: [siemens/jailhouse] 2a5249: README: Migrate to travis-ci.com URLs
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@github.com header.s=pf2014 header.b=vm26H1YN;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.203 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass
 (p=REJECT sp=REJECT dis=NONE) header.from=github.com
X-Original-From: whbo158 <noreply@github.com>
Reply-To: whbo158 <noreply@github.com>
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

  Branch: refs/heads/master
  Home:   https://github.com/siemens/jailhouse
  Commit: 2a524906c8cf573c1794fa300aa6c11bbfbd02f6
      https://github.com/siemens/jailhouse/commit/2a524906c8cf573c1794fa300aa6c11bbfbd02f6
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-01-25 (Mon, 25 Jan 2021)

  Changed paths:
    M README.md
    M ci/README.md

  Log Message:
  -----------
  README: Migrate to travis-ci.com URLs

The project has been migrated, just update some links.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 0efc2dcaf48bcac2c11636ed2db41e42dc091773
      https://github.com/siemens/jailhouse/commit/0efc2dcaf48bcac2c11636ed2db41e42dc091773
  Author: hongbo.wang <hongbo.wang@nxp.com>
  Date:   2021-02-19 (Fri, 19 Feb 2021)

  Changed paths:
    A configs/arm64/ls1043a-rdb-dpaa-linux-demo.c

  Log Message:
  -----------
  configs: ls1043a-rdb: add DPAA support in cell configure file

This file is used for the case that non-root linux cell own
all DPAA1 ports, root cell don't connect ethernet via DPAA ports.

If user want to non-root linux can connect ethernet or cloud
via DPAA ports, and need high performance, can choose this.

Signed-off-by: hongbo.wang <hongbo.wang@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 00f355b58a17fc307b73673a5f962a8c36eda574
      https://github.com/siemens/jailhouse/commit/00f355b58a17fc307b73673a5f962a8c36eda574
  Author: hongbo.wang <hongbo.wang@nxp.com>
  Date:   2021-02-27 (Sat, 27 Feb 2021)

  Changed paths:
    A configs/arm64/dts/inmate-ls1043a-rdb-fman-ucode.dtsi

  Log Message:
  -----------
  configs: ls1043a-rdb: add DPAA fman-ucode dtsi file

Signed-off-by: hongbo.wang <hongbo.wang@nxp.com>
[Jan: add copyright header, remove trailing whitespaces]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 6c09785cb079caa3852759ab59f0a5431380b200
      https://github.com/siemens/jailhouse/commit/6c09785cb079caa3852759ab59f0a5431380b200
  Author: hongbo.wang <hongbo.wang@nxp.com>
  Date:   2021-02-27 (Sat, 27 Feb 2021)

  Changed paths:
    A configs/arm64/dts/inmate-ls1043a-rdb-dpaa.dts

  Log Message:
  -----------
  configs: ls1043a-rdb: add DPAA support in linux inmate dts demo

If user want to non-root linux can connect ethernet or cloud
via DPAA ports, and need high performance, should choose this dts.

This file will include inmate-ls1043a-rdb-fman-ucode.dtsi
the related config file is ls1043a-rdb-dpaa-linux-demo.c

Signed-off-by: hongbo.wang <hongbo.wang@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/b91751cc3ce5...6c09785cb079

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/master/b91751-6c0978%40github.com.
