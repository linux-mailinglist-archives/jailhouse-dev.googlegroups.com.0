Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBIM5SXZAKGQEMS267UI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x339.google.com (mail-ot1-x339.google.com [IPv6:2607:f8b0:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D26015BF44
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Feb 2020 14:26:58 +0100 (CET)
Received: by mail-ot1-x339.google.com with SMTP id z3sf3052039oto.22
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Feb 2020 05:26:58 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581600417; cv=pass;
        d=google.com; s=arc-20160816;
        b=QBQwNWk3xj+OekbigSu1bPUedtpjFyiNxjeDtEWn5zJcCcyPc0O15q92epLex5x/ER
         17Z7c0m/ViqEzn3YrX17Hm3yWLQ66lT+c5qHmV9ILaKuEy8HARqf+dRYqv9pYWqrzPRu
         dG6HoeGMadaDB6yQuDaUUPahQ75N9SbdHSwl922r1USbyf49KBxnHASu1z8pp91YgNJM
         uZ4wG3pmcAFWs+0V9BM64/ARs0cS40qWqW/y6mOZjiV8sLH29O5Q4AiIjti1BMOAFph+
         PAuv5u7s7XmHtqoXYERaHO3BbeNltCsOBk01Dk8rybQKwdFmlnzpNxsJF6pOLBa+rPmn
         fV1g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=F4TVdHNUKXcpJmAAOl7KGMXcifvOHDlGOkEuxqdkcvs=;
        b=QEnk1eCLrCmoo3X+7eHvuq+0Gu0kzku0d7w06+cT4BdXVHkzEDfZIbXa3b8z21ZyAp
         e89GDCv5r6/J+nrEYDt3+8KqRN0d4MkXRFsCMwDfA8qDKySzEMD9WH7POfYH8c2TQfCG
         zDyDVyUqJHC7GTxZrNxzLHHIXcryofLgJzLDaTIbUbD7wxusHhoISIvJmoNBkLMzlYlp
         gM5BysbgwmD9Q73v7QMj7JjoZo6N33GFYqBuDRNsB2SI8Es6VO8YaXPmbiXTthfADlFn
         LyRBffCOc1n8LS3vjzCGlWv2oP9oFyVqcTTKrS3AkwAdVBLBCQ/jyesHIryJX2OCykjN
         hHKw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=phrADdCS;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.199 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=F4TVdHNUKXcpJmAAOl7KGMXcifvOHDlGOkEuxqdkcvs=;
        b=oCkdIRdtdUmcUmWexcKCTIbaFwmVJZEU6a+C5CFddl4fpHcqJqtBy6VmmnB2Iv7lgZ
         5G+6cjxraydZPbm4MalcNR7E7+58xa+LDLT4XN0avOLBimhNjf/tavso1AugkpHMp8qH
         RLTWnRwdFVnT3xrR6PW6mkEs6vPZ/dEHEKnYG3qG52LxJa3PQGMp1uSwiW9LSSMabKWn
         Hw/7ka+iWUZTUpW+zWNDRJJ2gZ50Ggp5ers/sP64mXQosmiImYn7wkwgCNUG1o7FG4nn
         UwcpSVhtSE7CLS6oo6pdpw1bujqs8ReCdV8/r8zYMP7aLOdYbsVjpQX6ve1EuU8QS+W4
         FGcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=F4TVdHNUKXcpJmAAOl7KGMXcifvOHDlGOkEuxqdkcvs=;
        b=ajFKo/OcBj/3TphleewRjhHJDTBWaglAKsh41+MS6aJPvfOwu2Jch1o6IyAAp8dkmA
         t/9PQsSdMdpU6xDDx41nwWipdX+Xv0/VT1syCbj3iQghu83f9/qjP3jG6bD2h7rGH/cC
         icCsckJHgAZQaQqFob6DT+jYQ5KXa1QC8dM4pgIDKobBqLaib1BrG7X5mZ9uVOP35zNx
         IuBx8Ifzebtd1PwHKlo1aJoUWwt/cfhbWFJXoBOrV+wPjbQh4e2XsmACVeofAR8jsjK3
         jdrbElSzDkpVFKpPu90pd+IPmP+qB1s+n4fc8gXcCWVFQIKTXMkwoDcbHjI/R4nXYaim
         wLRg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU+V4J9Sqau1L/4iIOURixNmXeu6fKxICuOYJQ5in5ULGMiofes
	hAUnePaeylSXL9dWLIZJ1wI=
X-Google-Smtp-Source: APXvYqz7X7tBIvA8zCWlbXoXg9zZWiuzJAauL7gcyzMbzkICgBmaWC/o9xJTGqr0RGwh4vQgVj1RAw==
X-Received: by 2002:a9d:48d:: with SMTP id 13mr12423048otm.249.1581600417253;
        Thu, 13 Feb 2020 05:26:57 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:d549:: with SMTP id m70ls7491856oig.10.gmail; Thu, 13
 Feb 2020 05:26:56 -0800 (PST)
X-Received: by 2002:aca:44d7:: with SMTP id r206mr2878244oia.33.1581600416713;
        Thu, 13 Feb 2020 05:26:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581600416; cv=none;
        d=google.com; s=arc-20160816;
        b=dXQVq4XTGbFL/gdRG+Ob8gLN+/54LdzeetCMIgXPX1mxBLjT9UQpN7Rj/Bx+BAW3nV
         rdQyDKsVqBEqFyBVLqKd8iZ78EjHo8ViRW3HoRiPx0SR0lw5cVCANrgZ8F1rOxyJXZTo
         xYtILz5GKJeibECxfsGy3mVt8AzY8qR04haK96bnhyjHqFoLsL/KNeK/7DofkyIuV8LG
         zMFnYvxVafsallZEx64JvGbta+eyDz2pC5bIzaF+P1gVx1jQtGL9KrzfXKkwrEQByXWP
         h+3zp4Wu8QlHmP+szzeP80WI5I/u7kpW3YQmWhEwwkJXKcALfvdo2FoSfr0LBaIGQmAL
         H10w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=+01L8zGtabYrLQ/c/hb8Rl0Esfp0RhuKSoFAguapOGk=;
        b=yTVl0Y/n+NzG/Evo8/dC/T9SurPmUtv5MzcOJwE38e9BxwSWgzAPSpKXsyhLHptAvR
         HGj1PZFBTU21C+PH8lKgxjcFUQwR4ezM9T0xQuT7fevLRnjg0GUJfUyIS8YHOM/vhDBx
         cd+2oqutxX0TrOTkSG5wdAHSz37PMDZeDPLQDKIJyPdqIYynwMbI5WoxNKQSCzhg31Ci
         wQBByz+rEFS0/FOXmsUeVL3O9fl8XN2VVgbjhEeXCIIR8DC0sMmOU/vIfpTKyTzRDFPX
         8/bsgBxzkc+vhgMUMgpv+FSWTdVTGemReSXL/k0eYY4MyfYc9n3ml9jw2P7V0r34WKNW
         MkGQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=phrADdCS;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.199 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-16.smtp.github.com (out-16.smtp.github.com. [192.30.254.199])
        by gmr-mx.google.com with ESMTPS id d6si112301oig.4.2020.02.13.05.26.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Feb 2020 05:26:56 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.254.199 as permitted sender) client-ip=192.30.254.199;
Date: Thu, 13 Feb 2020 05:26:55 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/7e538d-eb101d@github.com>
Subject: [siemens/jailhouse] a35bb0: driver: Account for constant name changes
 in 5.6
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=phrADdCS;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.254.199 as
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
  Commit: a35bb08187d4aa03f5cd5d26355bf0155c6563a0
      https://github.com/siemens/jailhouse/commit/a35bb08187d4aa03f5cd5d26355bf0155c6563a0
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-13 (Thu, 13 Feb 2020)

  Changed paths:
    M driver/main.c

  Log Message:
  -----------
  driver: Account for constant name changes in 5.6

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: eb101d0d853c8546d701aac4ccab3c251877a4d1
      https://github.com/siemens/jailhouse/commit/eb101d0d853c8546d701aac4ccab3c251877a4d1
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-13 (Thu, 13 Feb 2020)

  Changed paths:
    M driver/sysfs.c

  Log Message:
  -----------
  driver: Do not WARN if a cell CPU is missing in the root cell

This error will be reported by jailhouse_cmd_cell_create via -EBUSY and
is no reason to create a kernel warning.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/7e538dd94667...eb101d0d853c

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/7e538d-eb101d%40github.com.
