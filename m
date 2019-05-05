Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBK7NXLTAKGQENGJNDJA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x438.google.com (mail-pf1-x438.google.com [IPv6:2607:f8b0:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1D413EB8
	for <lists+jailhouse-dev@lfdr.de>; Sun,  5 May 2019 12:10:53 +0200 (CEST)
Received: by mail-pf1-x438.google.com with SMTP id 17sf6107408pfi.12
        for <lists+jailhouse-dev@lfdr.de>; Sun, 05 May 2019 03:10:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557051051; cv=pass;
        d=google.com; s=arc-20160816;
        b=i1C5V8HNAo5s7b/SdeXJUA1aCS5vZsJAmuf4Mk5ZpdnyB8Hcnghe/yYBnQlQXKpSQQ
         zWU2MxLedv8VIP8VvNzTiAX4n7d5NtqBSwZ7DQnqSv+rOA2uxKpF9pZPW6uYTCDDW4QS
         2m4K682AmCjTMgy5ZCEvN41xUkxieyI46/pP2yn2teCP4vTooLMO7Y0zdNI6aV/0Fvkz
         M4F2D6A7FfXHDisZpsP+9u88I2aAOEwLdaR0OOPOxmWkb32OgEbrdTVmsaz7L+h0v5gk
         Jq/jwA9p+zfny1LhJVsgBxzMrB9wRfkdeLx7IJhrcLQ9PAbt6RTuuX6cODu7nxQGoDGk
         VAkg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=cgnzucOWQRFx9HjYMLoeEraMv9icUijL+omL5hkYIJc=;
        b=0jRvFzx4QXBJgOiifq/u/I1C/khPAAyezumHT+waKwHOlK/gGGKDdMIXljkOdHxA5c
         zJiFPArk8UcTw4t8LFxLqNR5rXfyn7HYtmyP2EWn/NqvtKR3taqnIL2Eop6KBg5szfrf
         3d9PUlPt172TEbwJYXcki8OIbYPec4szmhOt++PSVOGDUKkrnNbrbk/cBEC9RkjKC8Eq
         kNjYcr6a1EEX/MVu9xpNdh4JUXxkownORTgvr8HzcOWlZ3xWVgPrAyNbJO0LIdvbJzQ3
         hMgiYqYwHsaVfvb3+hVMet1yIiHf2cGWGTPXK5pfauFOqqmBq6Wczwb205Vunsrstcls
         f97w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=yrkdmZf6;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.196 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cgnzucOWQRFx9HjYMLoeEraMv9icUijL+omL5hkYIJc=;
        b=c8xlXxV36pYgF0w7Rm4G5O/NIYjDWoWjaymm7ixVOSdEkMLemIghWxvwSS2MQZoZys
         4g8EgdGCLYJAUOZedqA403I7rB9Ne0qH4Sc97EJcf1TOGrwKJ5vzi65DOQ8iSEDmrT2g
         EdjkTm90dKp8lzyqbVvaohoPiFD3rKFSJk7VKydvhoAyz7BG9Pn+DLBpUV29q3DK6m9b
         WUis8n8rj6qdri5DO0NJx/7jIqj+NjsC+jbtOBXqUyDtnotIpW3OHAz7K84w3aN1V2wt
         8QKaldOn7uucfB/7jGojUvfE6hBcdnONl70MOFpatkPMNcNQk0WubxBdW1A/IihsLC1V
         gnEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=cgnzucOWQRFx9HjYMLoeEraMv9icUijL+omL5hkYIJc=;
        b=M3qbdLRwAN4jeiPFKPAlNVqUQx2rPmA6I34Vt6ZvTB/EwIlYT0BKCrldIAL2Zxif6q
         3GUaynOKuCUu6I3YzUix4hmGBAqv07iOpOhX7uGzGeZ7zkqjBEn7BZ6hhRlVo887OQH/
         ji/yCu7Nk/4CDQ4iNK5EO69giDbKMS9OZBSS/Yn2uSuNCSjEi4xV6Bul2ydOk+iiXqcj
         GUBgp1CgWVYLV47dYEt6islAbiSb3lz3cGLeG66E54ih+k4nTrWdHIrcwE6Q+8TZk7Z2
         Rab4T+QZr3wXtdmAZwXiM0p+BNRhG6NS5SCf/H11Ex4E7WOTjvNZ6GWu2NBYfSTz0z0R
         spcA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX0IeCV5GTFTPy+KqhqX3SQ8giyJOgbThmUX9y/dS/rblcJVRh7
	HcxqUCG2QyqtT79aNnszTgw=
X-Google-Smtp-Source: APXvYqxRQt2kQwP3UA+mcd78EjAHLpakGRT0ujR1Wel4pP8wr8ZMWSMdNAS1hhY8Sjb1V0e6SIMMcQ==
X-Received: by 2002:a63:2745:: with SMTP id n66mr23339851pgn.208.1557051051421;
        Sun, 05 May 2019 03:10:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:8287:: with SMTP id s7ls2678829pfm.7.gmail; Sun, 05 May
 2019 03:10:50 -0700 (PDT)
X-Received: by 2002:a62:4607:: with SMTP id t7mr25119074pfa.138.1557051050911;
        Sun, 05 May 2019 03:10:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557051050; cv=none;
        d=google.com; s=arc-20160816;
        b=OVQ88sEuCakxDYCRMPThqkW/lCLCfKxgYmbePlTHSFnLKry7Lwm3lrT+g4ghDURCi7
         a815mc8cI5S9sdn+LyQshwVFejrenReafOGNUu+plhEjyg4CexWTW8dGNk4OMgIx4JxS
         Wl1YRpG0tg4YEZVfJD8xZbOUKL8Nv0V7fN2hRKQnHdjLAuXLti9ON5PU0AftGicBWd9s
         Ha5FKkqSqs/kP3w032fdJIcuuPXIN3DRkHwt30kTLWpdS8ftxn5rrwaZIEZ6tDVUIvOq
         aVnuYF3qiTVHloaEnPLokH4Y3NU00S2dAmW5LHYzzrVqhI9UgEactgm3Ggr8Bvc9kZqN
         sLlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=ZeliCFTBm41Zd/9qssw8E6yj3UllrIGzUUAmDyrJgFY=;
        b=FPwnP1bYbUPyGkyqBBEWpQJVpV6R+sf/sU4yN5VI8Gas/Q6yycG8AAQNKMkuABYRTQ
         tpWTPJrcBg4LYMim+YGPjQOONAHW3NqJRlLexi+8ihK9df1zAaE51kICpQKhYR5ZgPbP
         UAToN3Fnchj0vznLieq2KMO1qx7re9t83fU2bKjSBM9e7t9kpy7TOgS1l5vmc0LiPFEA
         LO+g/AqdAynNRQUvqxsRV7MbhhJxQYNSI/nAxjuVpSOrnJ2alGaQqibWMeW3VztI3emx
         4wcq+szugBjzaiKUugltnJUXCz8qGcTzZJsnAymw2ZnPhrjXZMBwpJjOPhzsPAJ2gc5S
         Sqlw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=yrkdmZf6;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.196 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-5.smtp.github.com (out-5.smtp.github.com. [192.30.252.196])
        by gmr-mx.google.com with ESMTPS id 78si408094pft.1.2019.05.05.03.10.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 May 2019 03:10:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.196 as permitted sender) client-ip=192.30.252.196;
Date: Sun, 05 May 2019 03:10:50 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/b94228-2b1abe@github.com>
Subject: [siemens/jailhouse] 9bd27a: README: Link cosmetics
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=yrkdmZf6;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.196 as
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
  Commit: 9bd27afaed4f7f5d303dbe3e643e0628d4778e45
      https://github.com/siemens/jailhouse/commit/9bd27afaed4f7f5d303dbe3e643e0628d4778e45
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-05-05 (Sun, 05 May 2019)

  Changed paths:
    M README.md

  Log Message:
  -----------
  README: Link cosmetics

- gmane's web interface is dead, propose mail-archive.com instead
- use clear-text project name with coverity

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: faedc63365e364e03d2be590e55cca564148b374
      https://github.com/siemens/jailhouse/commit/faedc63365e364e03d2be590e55cca564148b374
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-05-05 (Sun, 05 May 2019)

  Changed paths:
    M inmates/demos/x86/apic-demo.c

  Log Message:
  -----------
  inmates: apic-demo: Plug race around message evaluation

If msg_to_cell was not JAILHOUSE_MSG_SHUTDOWN_REQUEST, we took the
default path which also sent back JAILHOUSE_MSG_UNKNOWN - and cleared
msg_to_cell before that. This created a race condition with the
hypervisor trying to sent the cell a message. Due to the hlt, the race
normally didn't matter so far. It will when moving to polling-based
idle.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 2b1abe0bf2f32b8a77ae12d98019aad2650fc498
      https://github.com/siemens/jailhouse/commit/2b1abe0bf2f32b8a77ae12d98019aad2650fc498
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-05-05 (Sun, 05 May 2019)

  Changed paths:
    M inmates/demos/x86/apic-demo.c

  Log Message:
  -----------
  inmates: apic-demo: Use polling idle to avoid latency spikes

It has been observed and also confirmed by Intel that hlt can cause
wake-up delay in the order of microseconds, although no particular power
management is requested this way. That's obviously because of
unpredictable decisions of the CPU how to react on that internally.

As the apic-demo is (also) about demonstrating the minimal possible
interrupt delay, switch to polling.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/b94228ca3ac8...2b1abe0bf2f3

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
