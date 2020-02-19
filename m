Return-Path: <jailhouse-dev+bncBDEKVJM7XAHRBL47WXZAKGQE5VHSNKI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 622101647E1
	for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Feb 2020 16:09:36 +0100 (CET)
Received: by mail-wm1-x33c.google.com with SMTP id b205sf330239wmh.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Feb 2020 07:09:36 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1582124976; cv=pass;
        d=google.com; s=arc-20160816;
        b=NTITCcahD5eHnflMeAQ3BkdL01g3c4DxMFyWFO8YGeSWficiSgiAWPQtUiuFW45eF7
         oBbs+gRO8Soh5LKCGP6dz6/QRROtbu9dvbgQf6lojDDe9JCfFG796Gf5eCZ8eVDbVe32
         9uYd8AaK5/YHiMnq34f68PziugLjW66EothmRLRwcOyHk/+fxT6VS+ji1rK34tOvKSDy
         goSox4Q9qvQ10X+syJfxPYJCA1CON192HKwUGbs3x3okScLzslaiWO4bnOxNQbuEwquk
         xtlJL17HgMCitANarnkkfVt2WD6VEpB5vBokuY1O/9fWwig/NHhm1IB7NNXLZ5VhBog/
         mYBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature;
        bh=DjmmoNbUS5z+3frk8FUzLtJRhHsx9vS3cGk5t8XB0+w=;
        b=06YI9F5klh713O1fm0UGlsKzDdGoazZulz6fJyvajhBMFfZLxdONVfj2c50NbQmgQ/
         85h0Qmg8sf/UZSvOeeVcH5V5CGHPq59tPMLPqZKatr7NWIFT8rCU9C1ku5zAfbV/UK46
         TSzGCNxDdxfKBzBLe+BAAoNdFrhl76xyPjRraWiC444cPANJOYNLOEasEUdpBkTiNtOh
         r2KuXqWgekB49GTHK2xUUBK2olqS1pmOm/BgweNVU245mcp4UK+cxpwnVsuwlxOx+Wnf
         6Slb5+exoLkt1GUermD/hOlygeCu4rYnxvWPxOebyESH/AgHJTWR+Hj6Te1ZVwfHAey4
         HC8A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=neutral (google.com: 212.227.17.13 is neither permitted nor denied by best guess record for domain of arnd@arndb.de) smtp.mailfrom=arnd@arndb.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DjmmoNbUS5z+3frk8FUzLtJRhHsx9vS3cGk5t8XB0+w=;
        b=HXswLskloFHJMgZYS2+fuXn0k6IahBrdfD//fp/cEuhbrZI4buCRCPACk2+Dt3LyNP
         FMTk6B1DQvhP60YUEiX59v/GsAmCNN2juGnKYtHaMrxtoPMxh2M6VWBwDi+JBepGxnhc
         5A/L6fiC8VigtUBwTcw6mRynqkRRtgrcIv21yLHNudGjRTKm1Cz81n2JMHe2f2f68M/P
         l/n5mkdR2YZkn8FyX+TEXXbM7bpxUuEVV7W14p0G7QiW1/hE2qFgu5gV3DIStIE+7Apu
         WOxsa3PiOx5h8j9oFTzAZ0nq97qMTLmFbtFy2eRWkYKvpr7dbis7eJsmsh88PPNLRC1R
         kflg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DjmmoNbUS5z+3frk8FUzLtJRhHsx9vS3cGk5t8XB0+w=;
        b=R19v6m1tQf/94rd/lG18wHbLC1dpjJCiWAdflJA+RDnKHGoy7LIYL6IRwO6gEk211M
         YCVXU0dVnte/MkJaVIBDRReceTK/eY2alq5o4ki7+nIjka+gdGxYaVQfQY4V6k6+eyP6
         jRh9qgrbgksdAv9JDVouYQea7SXNWDrG7UqKTbRDjHH7YhsHSTdtgZaYd+91dL3qzlQy
         JjRLepG0WKe/A4CAppMzsuPRY3mpVmLqBAPREryMmO9rYB5Y5xsguVyPUdWepEq9OVpt
         PG9DPdI9aRG52pXkTi2jKblvRk1WI6uBBTiAXmKJf1YFlew0g+kdrFNZl9GMEKM7gXuG
         ZTsg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWLuZWc/IyezRfxH9oYxXcZaeLhuiaWn15RhmS06o0V0ueImIc1
	si8gzGSx1hsP/SL+M/iEYrg=
X-Google-Smtp-Source: APXvYqz63OpwHj7QjqAzK76UNYIoV/BdJ3FldaJ8bycKkvAYurPxAjeqXWuO2jJNRFnp9QfHSmij+Q==
X-Received: by 2002:a1c:98d5:: with SMTP id a204mr10859084wme.181.1582124976080;
        Wed, 19 Feb 2020 07:09:36 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:d847:: with SMTP id k7ls9809840wrl.0.gmail; Wed, 19 Feb
 2020 07:09:35 -0800 (PST)
X-Received: by 2002:a5d:6a0f:: with SMTP id m15mr38123011wru.40.1582124975193;
        Wed, 19 Feb 2020 07:09:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582124975; cv=none;
        d=google.com; s=arc-20160816;
        b=wbu+Ynh5PtXa//tSLzp2kESqkr89DOP3JggV2Qvc57+2fqEX2XhopBK4Efpi3Zb3S7
         7qZbNMIg3MiXV3TOa6Xhe9h1FRv7suiBVO6IFYe4ARjp5Gt57IZAKdpv5VrN32JW0tZy
         vvFyQwFC4soEMP/qyfKFixGggkcr6jTcJ565TR8rfOFHnqNAUOXtViHq1Xcubf2yuguK
         n3IYTxFX75DA/DGgsjREcWBUqsXzjrVIDm2sjkMSLjhDX7Q5Auv5Hn6+J9lzDMo3ep/8
         7USXKxOnbAEp7h+Z52Zr13XHPIATcNgLqmS9gSMv/RYsQbEnwzSrkPg8Y9yCz5Q1dRkZ
         bHhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=NVMnS1dq3ow3/DA1LiQ2i1rOqcHzsYxUPVxPVRlhCIM=;
        b=AQUq+6gJIQGnPFR2l5k4hvu8yvExw+4vY0JBZRWzfmz+NUx/KWaNOzMnE+8hlZZGjJ
         i0qRXv3lO2uPnb1f0qvyGO82VeaTDVcl/dPzzQyx37+EUc1DZ3mLbR99SouHErOfyCdR
         yhTZhVV85KkTaIDmCUMpoEqoFrjDcxk6Z5YXLslKBZSJzXkmz36vYRb8OE7SRExI9i3c
         WqRFFAUYGDlKEpMAiJrLrDGGJgrguDTpOyK8MPaB9eBZjJxoS+8vzPwN2iSJdbMwr8N9
         iT0/niQUr4Pql85hALL8rNXz5dTClJY5ybtBCEFhYZyhad/3NGuMIP8eGBVg+nXgifZZ
         teTA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=neutral (google.com: 212.227.17.13 is neither permitted nor denied by best guess record for domain of arnd@arndb.de) smtp.mailfrom=arnd@arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.17.13])
        by gmr-mx.google.com with ESMTPS id i15si9400wro.2.2020.02.19.07.09.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Feb 2020 07:09:35 -0800 (PST)
Received-SPF: neutral (google.com: 212.227.17.13 is neither permitted nor denied by best guess record for domain of arnd@arndb.de) client-ip=212.227.17.13;
Received: from mail-qv1-f46.google.com ([209.85.219.46]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MwPfX-1jKimB2e97-00sMXP for <jailhouse-dev@googlegroups.com>; Wed, 19 Feb
 2020 16:09:34 +0100
Received: by mail-qv1-f46.google.com with SMTP id y2so302494qvu.13
        for <jailhouse-dev@googlegroups.com>; Wed, 19 Feb 2020 07:09:34 -0800 (PST)
X-Received: by 2002:ad4:52eb:: with SMTP id p11mr20046350qvu.211.1582124973474;
 Wed, 19 Feb 2020 07:09:33 -0800 (PST)
MIME-Version: 1.0
References: <20200210141324.21090-1-maz@kernel.org>
In-Reply-To: <20200210141324.21090-1-maz@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 19 Feb 2020 16:09:17 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3V=ur4AgLfat2cSyw8GrkCS2t06eqkzC-gXcc0xBpEPw@mail.gmail.com>
Message-ID: <CAK8P3a3V=ur4AgLfat2cSyw8GrkCS2t06eqkzC-gXcc0xBpEPw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] Removing support for 32bit KVM/arm host
To: Marc Zyngier <maz@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, kvmarm@lists.cs.columbia.edu, 
	kvm list <kvm@vger.kernel.org>, James Morse <james.morse@arm.com>, 
	Julien Thierry <julien.thierry.kdev@gmail.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christoffer Dall <Christoffer.Dall@arm.com>, 
	Will Deacon <will@kernel.org>, Quentin Perret <qperret@google.com>, 
	Russell King <linux@arm.linux.org.uk>, Vladimir Murzin <vladimir.murzin@arm.com>, 
	Anders Berg <anders.berg@lsi.com>, jailhouse-dev@googlegroups.com, 
	Jan Kiszka <jan.kiszka@siemens.com>, jean-philippe.brucker@arm.com
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:KYVEO2AY5b66g0Gqyn1FLYYjkbU0nWDTlP3vzZM1wEcFhgIz3vj
 azhRutSWZqSkT0i8yd1GBzi61RLRnUxRnpeUtVjlIUw8kJ9zP0tG7gUee92suXlxJvSLkHE
 4u1UaN9Hgol1FTPWo/hKo8CZvM4evhg2bqRDZXP1mA0/J2KS8NOaibZWy8ziA1j8PxPDmso
 SmwXYa48swTcowhyEBAQw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7YL1kX+6LVo=:QNqk4sBtlzR6vabIXFvUzm
 y37J7g2jXLVDpgAOY/SvVZBXW7laNXmtO0YkxU/dN+uVWbcYfAKzEWT8M23MP90Ievh4QY8tf
 1ORev37nI3yQMAV8+0AGsdkR9F8yfMmLpMirKInD4aA/yHrtr5ZufvMYDOhO5MkwHTAvtE3Sd
 pNXYePqC+52B4JUGiVV57X9Q4oZCzCKTigWlpRypz9vPPwZ9l2uChgm3WAfkRaXWF2joBSGVW
 HcXKPMChFzGB3QxaVnIm0d6Ua0zG37oRCfRCRmk8KaAhsLFFUgUNqWJJHrsrr5831s/iRRDAb
 q7rZKqlII/yaU/MIgemWFHbtvIJcUI0zz0ziY/KZnVi+fZVYUUntZEDrFLZgtm4NeHLMgyGP6
 PwNoBelHT0BtSK6oxfr5efAaoElJNkTgACzIm4KYO6SJhOYRlEs6MOxVK8inqcg1DA7jQeLQV
 hzC/9kS05pUiwpgf35YnHtS9exvQhqIhFDYGT4o/JgzMcIR90kRNtPf7pggFFT8XwFwb6rrJN
 lvZs6rh73PRUu8wPglRIp9JPyDxJujVOrFEvWHieBq4MqtaJ2hAq35VSXWwLCZZdxT/YD9P8u
 eu65RNIRyxX9JQjJDALULDNQPRXw3SCZkton6RhIzN+9iIFSgsSAYC978y+0fRT5cqa4JikVG
 OHbYGE3Tqaq0rD5DTDeA7DOaDd/8y8PJyeZzcF3EMOoyg4cMsVXnjKKs4CXm/wxADImfnsPHg
 CVoqVfew4sc/PCPdkvsJZw7OjIBKxsA3G6ae/ApmQCflHUBel/L7qebBt9HvNnFi0azTyiWM2
 NsjJSRe3VxgWNiWlicdniCh9pxJlYJH6/7hiW5F2fIbilgAsK8=
X-Original-Sender: arnd@arndb.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=neutral
 (google.com: 212.227.17.13 is neither permitted nor denied by best guess
 record for domain of arnd@arndb.de) smtp.mailfrom=arnd@arndb.de
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

On Mon, Feb 10, 2020 at 3:13 PM Marc Zyngier <maz@kernel.org> wrote:
>
> KVM/arm was merged just over 7 years ago, and has lived a very quiet
> life so far. It mostly works if you're prepared to deal with its
> limitations, it has been a good prototype for the arm64 version,
> but it suffers a few problems:
>
> - It is incomplete (no debug support, no PMU)
> - It hasn't followed any of the architectural evolutions
> - It has zero users (I don't count myself here)
> - It is more and more getting in the way of new arm64 developments
>
> So here it is: unless someone screams and shows that they rely on
> KVM/arm to be maintained upsteam, I'll remove 32bit host support
> form the tree. One of the reasons that makes me confident nobody is
> using it is that I never receive *any* bug report. Yes, it is perfect.
> But if you depend on KVM/arm being available in mainline, please shout.
>
> To reiterate: 32bit guest support for arm64 stays, of course. Only
> 32bit host goes. Once this is merged, I plan to move virt/kvm/arm to
> arm64, and cleanup all the now unnecessary abstractions.
>
> The patches have been generated with the -D option to avoid spamming
> everyone with huge diffs, and there is a kvm-arm/goodbye branch in
> my kernel.org repository.

Just one more thought before it's gone: is there any shared code
(header files?) that is used by the jailhouse hypervisor?

If there is, are there any plans to merge that into the mainline kernel
for arm32 in the near future?

I'm guessing the answer to at least one of those questions is 'no', so
we don't need to worry about it, but it seems better to ask.

      Arnd

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAK8P3a3V%3Dur4AgLfat2cSyw8GrkCS2t06eqkzC-gXcc0xBpEPw%40mail.gmail.com.
