Return-Path: <jailhouse-dev+bncBCWYH5WD24EBB54Q5XUAKGQEJ7YC52I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C0F5CF11
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jul 2019 14:05:12 +0200 (CEST)
Received: by mail-lj1-x23a.google.com with SMTP id c18sf3439171lji.19
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jul 2019 05:05:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562069111; cv=pass;
        d=google.com; s=arc-20160816;
        b=Q1f0YN/pzL1DWEJMQ3t2MymU4pI3BP2A7858iAKILw561bV5apq/NynToYWvP4yvNe
         ikMXCSVkQ6MTJQuhFtBeAvALLfKcLFGQZ6fnZnfhIFP340ptngMVXCiyaRd8ee6TKiBz
         fD7sp+WEFXk5m7BPRW5jcpT8PEj3CwfgcTCTvLTJEo4YUWuO3enjZebr3olkt+ndISIx
         MeDrRYQiMdbhVM0g8rVLRJWspQ6eg/DKFHbuc4hDmW970+BAhmXPbV1WIHfNEXaeUuzZ
         7zExR3Pn5uSAw9OAzA/Hbb9Xx9h10ZMUjpCentxAhEx3U8TDpKQ1VtpKjvh8plFvQWC5
         f6wQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=XyrcLXbB6oixb3GK6cKDo5SxUvEKc03sUPbWAyg/1tk=;
        b=lXWyAAvsS9QgFtahx3VExD4f597RFotse7PFf2ZYgbZojQG7LkWau/+fDjWWWqHqjE
         7R2dYXaG1LDHz3ODCRrz3lghjdptlmyTVyBd+flQX+VjBYnH1z75Wh76COHsPy7qURcG
         mBO8lptBeuM1PYAuQbEEXUi/1W7fP5bo/dBtoqdZJ9V9ToftgSMFAx47k9YwdPFGSn6L
         tAZf8X6XtlAJQW1kag4IfAuJSpQhtaIocSWwey9Y4Eiq3AXg7H3v1DsA+Lb5gy9bJ40T
         rU5+Yartr99oIABPdDJBXografIcobf6M/apmUJOQ/MMKHqHx2tSrmbDQnTGOhiJp0jH
         IrFQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=OIbwfRVw;
       spf=pass (google.com: domain of jan.hoogerbrugge@gmail.com designates 2a00:1450:4864:20::436 as permitted sender) smtp.mailfrom=jan.hoogerbrugge@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XyrcLXbB6oixb3GK6cKDo5SxUvEKc03sUPbWAyg/1tk=;
        b=eHqyPAf+ixOvp1IA0Ut1OGaIxF8VA2Rl8BAlaIlw11lbQKVWrLA8JxHmwxOtzuaOJ2
         qkZVrJWVfjmqdhTrsUwHPMbR34wIcrCBetJoyEQDozlB/wtMm2Kt71oCSgg3vvY00FN2
         tzZxgqiY6y+TOD/NhppyVzjfaGad/mqKideVoijEJuG6DQx8rfW51YB3ni/7oCnE3JNF
         d5GgiheltCw1HvOjM5uEBKOHIRNv1O6q1u8dSnjKL1/RJl0qX8Duu/oTp83VADItVrPe
         9vlV8jEkWM9QVV9A3qYkcEyEAHCzkqM5po0qJpQM/vSCCP42lFkgw6lssuuJvBfOlweQ
         oQEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=XyrcLXbB6oixb3GK6cKDo5SxUvEKc03sUPbWAyg/1tk=;
        b=rX2v18tvoZWGdi2hRYxcqny8eyWNLctMzkQrU1aa3W7YYwKZ5sExgd0zUMm4+pwQsR
         rfIvNRp3YK+RHaSC4jyfXDBg4vUEyG5bckcLt4emYY48sJf4dCY2RZDY5/Xao1NpqHbC
         vaIybypKgSuYCWnKCX/6n6vu8scXj1CZEz/MlT7fAymvXzSD+kpXxsH6OaUYcpDOkudI
         4GVNAeJ2SziH/nNWxLz3MSmYTcGkq7QAB7Mk3hAebDbQAa0tOgImvRWGmBmAeMeBzsrd
         rWeFVkzJjjHdtMHhOpgnVm7h4pA9PdLJ33AS3StCVH2fsB9VXicD7VbEeFQ4h0wICO6m
         Us/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=XyrcLXbB6oixb3GK6cKDo5SxUvEKc03sUPbWAyg/1tk=;
        b=jNpv2iVtS2WvCEpWiIxHskSFOkbVsQanZpnWxZnQ0cX1p4CnZWFdC24HNirTcyu7UE
         bSzg3iqNzvVte7p0buslt+dDlLp5upBefnyBErJEouLlUqvl+mZxI00oMAw5uGhEroM0
         i1j9SiCvb8KUSuVsWCINujWcRi4c+vz0EGNjUDVYhdBuxQUAgEjSaTbS8lFaTX8y1cDZ
         rNzSnVClFa0ONNncSWMdnGxEmzL0+Z1tG7E5B5DlcUVzXn7xQYWY+tMeYkN20sUHjziW
         wsjHvUFzRukG77vQLFf12SpmW9oX0HnvEA6WJo39vqJ4ZGGtzJrrv211T9Pto2Jvz4eF
         sXDg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVbTn+ckLgEDocFIoIlrGGGSO85fUgKDLIHgNyEPwCLhqes1uvc
	QED6AFHNzuwP0P+We3gG/O4=
X-Google-Smtp-Source: APXvYqyZ+0NbMBBG36jpRi7XiCSnxVLAoBqlLfKydyrpi5tZ6QPayOf7iriEJwxJ/4227SKrM4sBeg==
X-Received: by 2002:a2e:9b84:: with SMTP id z4mr17459106lji.75.1562069111870;
        Tue, 02 Jul 2019 05:05:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5605:: with SMTP id v5ls19059lfd.6.gmail; Tue, 02 Jul
 2019 05:05:11 -0700 (PDT)
X-Received: by 2002:ac2:5337:: with SMTP id f23mr14864229lfh.15.1562069111221;
        Tue, 02 Jul 2019 05:05:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562069111; cv=none;
        d=google.com; s=arc-20160816;
        b=grCCRI4biOPjDuRJnyQFbM++rp0cGUbWm+MH9alCEi5GLTeqVzaG1CU55h4El7jMMw
         ErXgAur+4sAnRR/a1FbqU9v6GtqVJkQVAvPyBRJNSkywqfeSzcH2mE0MQI4g0F9tld8N
         cONYHKzrnyX87NWJOy2eM3/0S1w+7LK/uk3bFgx8Yh9kuKN8juf1d8GnYJWRtfssM+4r
         3Z34E3zVYDc2DCwVCaeg25OAYgDu/bRyGEHvOlq8JSyuVWn3mXj5RLsKblcETEr+oXBE
         Q+8Nh8qbSgXm8nF4xcgH20p1sIuf63SPeTR2F/acJozB/XP6ihhyeRvTLsNKDf33gJJ0
         qAOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=v4om7u84u1SAZZmcejze1t7BAPeXP4au3KO6AdPL7eo=;
        b=Fwff3HqNVgq0duKRkt6PM2kSP8ZqBWsla+yuvTSpkHZUmDsorEdBN0gP3JoV6uGssf
         AqImXA6ACdJmYZmIE8W05xRnbUDRoilfivXt/ETrFcIQunhCPk/s1qKM78DzyjBUiCME
         uGZZIBpkS9/WaoxzyoEKzxENqM5iPcKC3JtTopJXisGHCX5MmOXIW3CHaSuy1qt5LnVC
         LqHtV3ATBnZ0FOoe9A28cgR8hXurS0yCWzQJYCUTqlhPKwQZ8m5K6IABb2XPi7jinD6S
         V6CXk+h2o6bit4d7FgihxdLJCFsGsTdMlzuHMUmXvm4FtJvCcc3OkUYPt3rxIR2ayNvT
         FaQw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=OIbwfRVw;
       spf=pass (google.com: domain of jan.hoogerbrugge@gmail.com designates 2a00:1450:4864:20::436 as permitted sender) smtp.mailfrom=jan.hoogerbrugge@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com. [2a00:1450:4864:20::436])
        by gmr-mx.google.com with ESMTPS id q7si232404lji.5.2019.07.02.05.05.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 05:05:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.hoogerbrugge@gmail.com designates 2a00:1450:4864:20::436 as permitted sender) client-ip=2a00:1450:4864:20::436;
Received: by mail-wr1-x436.google.com with SMTP id u18so987495wru.1
        for <jailhouse-dev@googlegroups.com>; Tue, 02 Jul 2019 05:05:11 -0700 (PDT)
X-Received: by 2002:a5d:5112:: with SMTP id s18mr22552800wrt.111.1562069110636;
 Tue, 02 Jul 2019 05:05:10 -0700 (PDT)
MIME-Version: 1.0
From: Jan Hoogerbrugge <jan.hoogerbrugge@gmail.com>
Date: Tue, 2 Jul 2019 13:59:26 +0200
Message-ID: <CAD9j0toG2Cq3T58xEzDOzHbSpa3fqddcGsLevN54=ZHH7aWkug@mail.gmail.com>
Subject: Making stage 2 page table entries read-only
To: jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="0000000000007444d3058cb18e70"
X-Original-Sender: jan.hoogerbrugge@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=OIbwfRVw;       spf=pass
 (google.com: domain of jan.hoogerbrugge@gmail.com designates
 2a00:1450:4864:20::436 as permitted sender) smtp.mailfrom=jan.hoogerbrugge@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--0000000000007444d3058cb18e70
Content-Type: text/plain; charset="UTF-8"

Hi,

For kernel protection purposes I want to make kernel read-only memory
pages also read-only in stage 2 so that if malicious code in the kernel
tries
to modify read-only memory by first making it writable in stage 1 that then
a read-only stage 2 page table entry will catch this.

I want to do this for arm64.

How to do this? Where is the 2nd stage table constructed? What kind of
exception
can I expect when the kernel writes to data via a stage 1 access where
writes
are allowed followed by a stage 2 where writes are not allowed?

Thanks!

Regards,
Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAD9j0toG2Cq3T58xEzDOzHbSpa3fqddcGsLevN54%3DZHH7aWkug%40mail.gmail.com.
For more options, visit https://groups.google.com/d/optout.

--0000000000007444d3058cb18e70
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>For kernel protection pu=
rposes I want to make kernel read-only memory</div><div>pages also read-onl=
y in stage 2 so that if malicious code in the kernel tries</div><div>to mod=
ify read-only memory by first making it writable in stage 1 that then <br><=
/div><div>a read-only stage 2 page table entry will catch this. <br></div><=
div><br></div><div>I want to do this for arm64.</div><div><br></div><div>Ho=
w to do this? Where is the 2nd stage table constructed? What kind of except=
ion</div><div>can I expect when the kernel writes to data via a stage 1 acc=
ess where writes</div><div>are allowed followed by a stage 2 where writes a=
re not allowed?</div><div><br></div><div>Thanks!</div><div><br></div><div>R=
egards,</div><div>Jan<br></div><div><br></div><div><br></div><div><br></div=
><div><br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAD9j0toG2Cq3T58xEzDOzHbSpa3fqddcGsLevN54%3DZHH7aW=
kug%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CAD9j0toG2Cq3T58xEzDOzHbSpa3fqddcGsLevN54=
%3DZHH7aWkug%40mail.gmail.com</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

--0000000000007444d3058cb18e70--
