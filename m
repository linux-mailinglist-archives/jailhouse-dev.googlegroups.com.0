Return-Path: <jailhouse-dev+bncBDCIDHFI3EEBBDHU36QQMGQE6Y7ECAA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83d.google.com (mail-qt1-x83d.google.com [IPv6:2607:f8b0:4864:20::83d])
	by mail.lfdr.de (Postfix) with ESMTPS id 979246E0DA7
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Apr 2023 14:48:13 +0200 (CEST)
Received: by mail-qt1-x83d.google.com with SMTP id r22-20020ac85c96000000b003e638022bc9sf28594232qta.5
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Apr 2023 05:48:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1681390092; cv=pass;
        d=google.com; s=arc-20160816;
        b=xiUAWf+JFWb8G9fT+IXKGqL77P4J9W03e4AAuw5/lNC8KWQ/p7ifR7pAFfH0xYGFmX
         3yKOdPXjtJhE2kLtf6dMBiWbswLgjxnLVyrUUQwZS1jtCvC41T50zF4j8FeNrQ8MshMi
         CRy8O3LkKbhPNoCi+dQ20/yuyi+Jvj+dVeHmH28MNUVSvg6g6G7hQZeRGK/IoEM0afIU
         cXqpBEKcdWtWklp4YAS/kLbHAf8SnufQsR3x0W+wGC3PAzp/uxTT5/kramxHl4JJ+pRJ
         vsWq6XZ09VkXJ3/K3W6axIO0RU7FLluE+6EANnpbE7JNFziB7OCZiAU5DCtuspjchZJT
         hELw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :reply-to:mime-version:sender:dkim-signature:dkim-signature;
        bh=Cy7uuB/iIHPX9AaxHQgQNrNWUOx0qDeXrHFCdoRG/rQ=;
        b=hr2Dh6zzEj2gmAIpHfkdtQ0nGFGKwkxeALIbnnArYarO+Vg8er9k4PIv8mTQ0cMIXY
         0InLNLZklZENbi+86ggfChdD2vSPBVkR0/RCfq2WjcvJtIigULymdONcI2ITKa7SebVF
         /GrZ0Y6SKCHwnM7/b4F/37WbQAQs7tBhoY0VMQQ8rzRg2wFCbEPNxxXTubSKzpfzoxX3
         rklsjWf0AqCrDJ69I4ijjyza13nd18+m65bzu+GfQ5TaBBN2Lo4r2atFbgpcgQuw0IPp
         MKeS94vy56N6Eo5px9TNC2Ia7x2aADo8089HZNJT//Gud+N8qAVIReNV8oqxqLe6UOkV
         8qCQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=FNvVzWg7;
       spf=pass (google.com: domain of bandeharouna3@gmail.com designates 2607:f8b0:4864:20::112b as permitted sender) smtp.mailfrom=bandeharouna3@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1681390092; x=1683982092;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:subject:message-id:date:from:reply-to
         :mime-version:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Cy7uuB/iIHPX9AaxHQgQNrNWUOx0qDeXrHFCdoRG/rQ=;
        b=VtJVXn/zkBmxONpnnCaF9pfYB3dux8TyBAeLoKMqYZlKqrU6DqgmGeevH3ywJZBr7U
         WewK4eOFjT0BHpmjFSERLQPIObR2CLqBJGAuu/KjV8lSqYBnucQTCSsfTOcSxFLqyAth
         9Up25ylfvzHI5rscypirkC/aXJ0bD9043jOJT8sUwd2OV8PO11Ai8gATIVshKpQiJBoe
         LXYSLCAhcsNI3vj6aFbdKLQ9HMTkxZOjSeScmU3WfAGQowcpW6ytLzWbGR2kN1z+6MXg
         uMrqyWczqIfADm1/JkJxaC67+8l6AMrRvS7AWYWVs4NHOnns9QaDE6FS8lD5lvJYA47i
         oKXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681390092; x=1683982092;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Cy7uuB/iIHPX9AaxHQgQNrNWUOx0qDeXrHFCdoRG/rQ=;
        b=JwEH/44koFy3NyKOYqYF8xrJO4+AfRu77RwXAIwEpz6XrugCK98TXgtogfZx9F19sQ
         /9A7b3vqrRD+r45Qg8CtUYZHrjJmJZs5a6cDiuSLJQz9+tx0e5Mw0mI+CTRvxCBU5e0Q
         4SPm3ZfOWbpai39E4BCuEeRb7wtdQ4ag9JFRR9BcLXtXReMXEyCc4B5VwoSeTHRj/KkU
         DjXhNnR+mZWLP370om2wofKj+//Bk9yINuNrPekEK1AakjQ88VSgtrzAkljU3K0Tdua0
         eRHCKpu0wx2N/sDgzRse6L9EXoFFgNe7zq0E47BgFX5CX3xuJ2oGSuyXJVAN5tp7Axkg
         0D5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681390092; x=1683982092;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:to:subject
         :message-id:date:from:reply-to:mime-version:x-beenthere
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cy7uuB/iIHPX9AaxHQgQNrNWUOx0qDeXrHFCdoRG/rQ=;
        b=AKajV7LbUG+rPiZKhrDCkPqbE6IjKuVtZ8wOraQ09eZKBsN4YndPWxvM/2YlIVhEL4
         kU48JZlR1v2ZXDJglOqGBYBeY7Yt8WRU8IQcUCl3tcseoggEejbXnl/wPtJGumfINaDt
         WXwCrEiGTLGje9zn0bqwbQDM+HlTkx0PGhICq5uIZr1Toaja9bH/8kguBAiKfh231ybS
         C2pythbQ0aqdrXIZnJ1oXzTaX2p/Uajk76qBOOp5lNR0adMPc71UeNRKf6XmS0JYR/Nw
         ksX9KaWrPAeD6lZ/Uc3ke2nbc5t8kNTnVVKbBRtXTPHwrznWryNMjFSbzCRgn0PYqVXH
         pqWg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AAQBX9ecMp0TVIKTGeQBzVLHKSuD2BE8zNiphMf8SndP/5d1V4gVjKDm
	nni0d5XjGqjyU09+UYlVBLc=
X-Google-Smtp-Source: AKy350YcoB4nJLCHyfPgcVxEMA8VIWv1V29QTAhn3UmGi8XEQocI+iB1Yc9YsBHJdergH7NS/i9aHA==
X-Received: by 2002:a05:622a:1b9e:b0:3e3:2af6:7edc with SMTP id bp30-20020a05622a1b9e00b003e32af67edcmr625480qtb.4.1681390092349;
        Thu, 13 Apr 2023 05:48:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6214:4599:b0:5e8:ac03:a05a with SMTP id
 op25-20020a056214459900b005e8ac03a05als10897562qvb.1.-pod-prod-gmail; Thu, 13
 Apr 2023 05:48:11 -0700 (PDT)
X-Received: by 2002:a05:6214:3008:b0:56e:b557:2d4e with SMTP id ke8-20020a056214300800b0056eb5572d4emr3087210qvb.6.1681390091602;
        Thu, 13 Apr 2023 05:48:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681390091; cv=none;
        d=google.com; s=arc-20160816;
        b=PEFsspp/RG/GAdDEN6rTzqi8n83a3R5WJbqoGg5iuBNMZDDa6DkeGjnJ1cOYMqqKby
         zK67olp7jPjRxheZFjS3Ok/ToS6qGmMkFR5Q2OjFl0vzpnn7CqoNjwfi5uGSUeWzksPn
         v09XEwAIYHDH2uZT2O+VQl6KkvcKw6QQ651sj7cVwzU+cVvtoL5xxBVR6EP+xGukEM2h
         TcMf3RfFy+6a4TIeyBl1m9DTKgR0xEOSD3USKsY7r3ERrw8xeQzuJPOgRKFCBBSavOhu
         W/qdGX7zX/BZ1lCVZe+mqWL2EBd1s2W3SPapmwvbUly9ZRij1OmnZdHEgutsQiL84DwE
         cBgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :dkim-signature;
        bh=5RfXJvDmjvocWuhXvJ6jLpYq4JXsjR+fgzQcvxm1L7I=;
        b=CpfCp1NDH3G9LUas/y0PjXWcGusz/Kn99AUOi04x8VgVn2vRXsup8Gu65KYp+tYiiJ
         FAUWDJx/5urbq+BS8CZqrvfvbDuV1aMluLOtajK9CkJ3tZhZv8afIC9Skz3aJjCvcELu
         z2AmS8knCub/JpIZn4dbvBVEoNu/tU3vkNJhZh0UvRqEB0ztA5zcH2YTvFG1n5ys78M9
         Y/VizCcx+iWigcKHF7i37fiomUO0EkjEmAnldsMRTiL0PnAtLr/ZBLvCWo174wTCzVWw
         mCONyVFv3Wf1Q1EwjqI4p/eszhzXVPNBJxeZs1T0B0t1N3Z+jNTl3esqgom+dILx69I8
         UwLA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=FNvVzWg7;
       spf=pass (google.com: domain of bandeharouna3@gmail.com designates 2607:f8b0:4864:20::112b as permitted sender) smtp.mailfrom=bandeharouna3@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com. [2607:f8b0:4864:20::112b])
        by gmr-mx.google.com with ESMTPS id om24-20020a0562143d9800b005ef46b24423si60838qvb.8.2023.04.13.05.48.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 05:48:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of bandeharouna3@gmail.com designates 2607:f8b0:4864:20::112b as permitted sender) client-ip=2607:f8b0:4864:20::112b;
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-54fb615ac3dso66508717b3.2
        for <jailhouse-dev@googlegroups.com>; Thu, 13 Apr 2023 05:48:11 -0700 (PDT)
X-Received: by 2002:a81:1b8e:0:b0:533:a15a:d33e with SMTP id
 b136-20020a811b8e000000b00533a15ad33emr4705355ywb.5.1681390091274; Thu, 13
 Apr 2023 05:48:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7000:5e1c:b0:4a3:9eb7:336 with HTTP; Thu, 13 Apr 2023
 05:48:11 -0700 (PDT)
Reply-To: mrs.elizabethedward77@gmail.com
From: "Mrs. Elizabeth Edward" <bandeharouna3@gmail.com>
Date: Thu, 13 Apr 2023 04:48:11 -0800
Message-ID: <CAL7D5sG9V6ejaH7X9FvVmExgux5DBwbrabKitdRS8NJe7YZHww@mail.gmail.com>
Subject: HELLO
To: undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: bandeharouna3@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20221208 header.b=FNvVzWg7;       spf=pass
 (google.com: domain of bandeharouna3@gmail.com designates 2607:f8b0:4864:20::112b
 as permitted sender) smtp.mailfrom=bandeharouna3@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

Greetings
Please forgive me for approaching you through this media. I am Mrs.
Elizabeth Edward, 63 years, from the USA, I am childless and I am
suffering from a pro-long critical cancer, my doctors confirmed I may
not live a few months from now as my ill health has defiled all forms
of medical treatment.

Since my days are numbered, I have decided willingly to fulfill my
long-time promise to donate you the sum ($7.000.000.00) million
dollars I inherited from my late husband Mr. Edward Herbart foreign
bank account for charities work of God and there is no risk involved;
it is 100% hitch free & safe because it is my inheritance from late
husband.

If you will be interesting to assist in getting this deposit fund
transfer into your account for charity for the mutual benefit of
orphans and the less privileged project to fulfill my promise before I
die, please let me Know immediately and you will take 50% percent of
the total money for your effort and assistance while 50% of the money
will go to charity project. I will appreciate your utmost
confidentiality as I wait for your reply.
God Bless you,
Mrs. Elizabeth Edward.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAL7D5sG9V6ejaH7X9FvVmExgux5DBwbrabKitdRS8NJe7YZHww%40mail.gmail.com.
