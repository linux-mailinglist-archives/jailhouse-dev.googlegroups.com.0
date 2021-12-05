Return-Path: <jailhouse-dev+bncBC2K5P7Y4QOBBPHGWCGQMGQE27G3RXQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id CB58C4688FC
	for <lists+jailhouse-dev@lfdr.de>; Sun,  5 Dec 2021 04:34:21 +0100 (CET)
Received: by mail-lf1-x13d.google.com with SMTP id j9-20020a05651231c900b004037efe9fddsf2037646lfe.18
        for <lists+jailhouse-dev@lfdr.de>; Sat, 04 Dec 2021 19:34:21 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1638675261; cv=pass;
        d=google.com; s=arc-20160816;
        b=S5RgbQ8WYupSsBbO5YyGYQpAEwzg3rreEX8LzoJUeueoQjlAvsNVgaRXQQ4XR+eqZU
         nlME9sxJ9wA47SoUsPDza44vdrWjn/ZY8n4nR4OTE2eYBLDJnT6x2mo61GsmMVUeIh/8
         jQc8AaJpYpzwEHIbH5OOYGN2R7ys8wX7v80NezM24VhfQfiwzSCs66IorTYxdCzxLnZ6
         ECaQxRUXzW8MYgDLz5s3eR2xVAFdkF8gZBp8kEbYNyD1LYo1SzhvlKJci6AFCAX7T9x6
         SUQykTPjAzfoUJDJBs70Jpnxgav8kVmeqnNNEN0JSEFZ+x9kmXJGEY8jwC135qG5aO9R
         oOug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=Z4BCG4hL3hHotu192VocBrnhHNsYm6xpX6crPbYWohg=;
        b=yk4Y1jFZcnPag/EQB8R7ncPyJ28lc9KP/4BWP/NVpeLB78Eh5EoObpsuK/BanlsHH6
         jsvIFtD2/7eTu3pOo5sPW+/9yc1qU9h+uqhjknbJAZQ5FdukFrXz4yJNcs4+k+w0kKWy
         pA8psfLMVlj33T+IfIvxGomXliUbvlmKvyjq0c2DPDGJHaoDksuBgZc7jyPClmWs6a7p
         XJ+Gf5FtRroiNzCzT30QeJkhA7oYM/7Hyfdr01V20g6r168NXq1yyJtElKy0P8Ppih0J
         O97hgF1WnANZGlddmiQooY2bTMAvRAl1G2uxZBfd+h3Oy5XM4G8jjyvlOcj/nWcBMg0G
         U+IQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=XxqWBIVU;
       spf=pass (google.com: domain of royalnationalhospitalh@gmail.com designates 2a00:1450:4864:20::229 as permitted sender) smtp.mailfrom=royalnationalhospitalh@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Z4BCG4hL3hHotu192VocBrnhHNsYm6xpX6crPbYWohg=;
        b=Jb8bvbZzFOHsEQYwDAZZoT9KtwxT1AkM0ZQtXIGznb3Yedw4mMKDoqOhYVy83DPCXG
         PzdAVWeNoXhrNlXhSMq8YmJtwirDdvEV+Z8gUP4AJsZhC03D3NW5tJ3+gG8QgqJVaiV9
         KvKDo+42PRpN5cwSgIGFecc3lis1VCrk0M1AupLfCDm2wIfkdSNmdRbbwBe6QPCniA+l
         wzx9IISewBAJu5Pt6ggJXTK0x98fzdIcW20/x+rhpQt0zIMdnLlKBoJx0xR7lmWkQjlS
         KtB4RdO08fGZ2PQPouDbgTuEpK1Ipgv398jz3zxrCDngOsrVLPNyZy282Jg2nLRA0Tyd
         83tg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Z4BCG4hL3hHotu192VocBrnhHNsYm6xpX6crPbYWohg=;
        b=YRYsmZk91O8or95Arl8+h152ZFlUSofkPP04UQt0xXRq0vHGxBrTqsAhTOGUNKuMeb
         JxLhCOc0enU7QegP5pTEuqS86XG+BiZliwCrCEU+xI1uj7J1Esi7/tUe3zratUpd9fyI
         uiTcYqC3pkBmnzAg1sFQaow8y7NKoapE5+rM+jMAxLU2osq85p3Z5I5qp6h+PnsSSe/0
         ciFwHCBot0IYVtX1xGlsBKsaxQP9xuvJjeUBS0lLX/xXeKTMs+VK9dljEZrLfmHxIU1s
         z0y4q9oCIqB/wnQKHfd5O96B/olRMHWxZdeBIZvnIFCMFqu/NIPKRa496xi2pqOXyrsL
         6Eaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Z4BCG4hL3hHotu192VocBrnhHNsYm6xpX6crPbYWohg=;
        b=Dsm8Q1u+Iu5QS9G9tLbmQHFCXNnKOcwCaNPVgjaPT/KIdFqb7pIUaifFh/3AfTcKA6
         ledM0Yf8/lZgLPWZZse1c+iwtwlTi4Blj7o2K4g59iWPp/I8zJ6AdNMw1neRKcUi98KU
         34mpcbFiCaKkEFghmw9KxKLw1YSvw/03me2a7pgLhHc7zA05c4QQfy/x6DAdjJqaaaor
         B7CYaXxwZtFydeoSjmA9snLJ20LlCFybWXf2H+OzdRCxrO1x0en7Pi8H/4hrhsp6tM11
         no42XgA9CWsgPnvxg7XV+CIOIAhS5gSH5dWU7CLN5F/VOiGT3RwyREt7nwScUcL4nEF2
         RuZg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533DTG/XFMvtpFMvtnTe0nf/C8Fgf4S+LEe9is0z9sFGrRW9xIJk
	wJBTEZnxcAQ91cIm0H9tchY=
X-Google-Smtp-Source: ABdhPJzGYGnioUc7NYPTh8/9jVUTonKGbrnN7tjRITrscTlSJlXooY5yXLJ4GCcQ84Qo3x8WIJ15VQ==
X-Received: by 2002:a2e:9b17:: with SMTP id u23mr28133812lji.258.1638675261260;
        Sat, 04 Dec 2021 19:34:21 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3d9e:: with SMTP id k30ls2072455lfv.1.gmail; Sat,
 04 Dec 2021 19:34:20 -0800 (PST)
X-Received: by 2002:a05:6512:2295:: with SMTP id f21mr28220710lfu.259.1638675260159;
        Sat, 04 Dec 2021 19:34:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638675260; cv=none;
        d=google.com; s=arc-20160816;
        b=k2bY099PkzZmttMHTYFF5DSHFUITXxSTDRCskV9GseIaw/6WOhJVcHxQHMIWoTYQe9
         dXflqzAP+NiI4TSP9r3OQYHre1wwbfWC+GXgi4SxNx7plZiKFnW0pgIeqATa6JwpDU38
         8Mr915M1VUQu+ocVdrhz5TIFDAWdpiu/KRzBuuZa+AcZqq2zY4r2zavuNh+4BtDCxf/s
         0MD/WcT+hZiyVzAzclyTFDA+YuVbpg5FOW2fSpUUzBf8LFL6A6S9rBWWobetZ2Gz4yY5
         uBbsBqJwwHmG01HeGZKhk45jwuM9jUGrnkgvCNYdeo5Wuo3CV4yWkH5toEHM659rOYZU
         V8sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=LPcOW1i8sELnvCxS+sTf68V1ZE//q7DLjOlwq5As8oU=;
        b=xyHLblUF3pfgjKdYD/+uCkySWSrIJFjnxL64+gsVQNG2ysFNFtOO5ikBhas08W0V7R
         Jf6nFHunWstUEz3l1/+Q8B20B79W+TGnb8AZL5vw9yyKk6nxH1zvxhSWs1jPoX2bASg5
         ilmYpHZSO4kWyhAmCcFGo7p5hIPNtEfnJEwatGix0ljDk+OuSGX2S4hoV4s0AlFrnUy9
         Uqd9NKaj9z1UGGoiy/hXUnixEydnfYo73fvgWX86blnZPJJMhWS9RCjuaSI5PaW4KBGp
         F9UaMzPZi7SUFf6umW/nxha/CyBIz2HSpfQ6Bxm6uOFT33Xs7ae9q+DCkSJdgT7cB8xB
         vcaw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=XxqWBIVU;
       spf=pass (google.com: domain of royalnationalhospitalh@gmail.com designates 2a00:1450:4864:20::229 as permitted sender) smtp.mailfrom=royalnationalhospitalh@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com. [2a00:1450:4864:20::229])
        by gmr-mx.google.com with ESMTPS id g21si519950lfv.11.2021.12.04.19.34.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Dec 2021 19:34:20 -0800 (PST)
Received-SPF: pass (google.com: domain of royalnationalhospitalh@gmail.com designates 2a00:1450:4864:20::229 as permitted sender) client-ip=2a00:1450:4864:20::229;
Received: by mail-lj1-x229.google.com with SMTP id p8so14145304ljo.5
        for <jailhouse-dev@googlegroups.com>; Sat, 04 Dec 2021 19:34:20 -0800 (PST)
X-Received: by 2002:a2e:b528:: with SMTP id z8mr29210327ljm.178.1638675259998;
 Sat, 04 Dec 2021 19:34:19 -0800 (PST)
MIME-Version: 1.0
From: hi <royalnationalhospitalh@gmail.com>
Date: Sun, 5 Dec 2021 09:04:08 +0530
Message-ID: <CADBYqjPb3=hh+RhfCCzHXdZWh2jfrBm+s8=X37v9GksJu81ZRg@mail.gmail.com>
Subject: 1-1
To: britishhighcommi111@gmail.com
Content-Type: multipart/mixed; boundary="000000000000c6606405d25dd0dd"
X-Original-Sender: royalnationalhospitalh@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=XxqWBIVU;       spf=pass
 (google.com: domain of royalnationalhospitalh@gmail.com designates
 2a00:1450:4864:20::229 as permitted sender) smtp.mailfrom=royalnationalhospitalh@gmail.com;
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

--000000000000c6606405d25dd0dd
Content-Type: multipart/alternative; boundary="000000000000c6606305d25dd0db"

--000000000000c6606305d25dd0db
Content-Type: text/plain; charset="UTF-8"



-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CADBYqjPb3%3Dhh%2BRhfCCzHXdZWh2jfrBm%2Bs8%3DX37v9GksJu81ZRg%40mail.gmail.com.

--000000000000c6606305d25dd0db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CADBYqjPb3%3Dhh%2BRhfCCzHXdZWh2jfrBm%2Bs8%3DX37v9G=
ksJu81ZRg%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://=
groups.google.com/d/msgid/jailhouse-dev/CADBYqjPb3%3Dhh%2BRhfCCzHXdZWh2jfrB=
m%2Bs8%3DX37v9GksJu81ZRg%40mail.gmail.com</a>.<br />

--000000000000c6606305d25dd0db--
--000000000000c6606405d25dd0dd
Content-Type: text/plain; charset="windows-1252"; name="a-c.txt"
Content-Disposition: attachment; filename="a-c.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_kwsov0tk0>
X-Attachment-Id: f_kwsov0tk0

VGhpcyBpcyB0byBpbmZvcm0geW91IHRoYXQgeW91IGhhdmUgd29uIGEgcHJpemUgbW9uZXkgb2Yg
ozUwMCwwMDAuMDAsKE9uZSBIdW5kcmVkIGFuZCBGaWZ0eSBUaG91c2FuZCBQb3VuZHMpZnJvbSB0
aGVDb2NhLUNvbGEgTG90dGVyeSBwcm9tb3Rpb24gVW5pdGVkIEtpbmdkb20gd2hpY2ggaXMgb3Jn
YW5pemVkIGJ5IENvY2EtQ29sYSBpbiBjb25qdW5jdGlvbiB3aXRoIENoZXZyb24gVGV4YWNvIE9p
bCBhbmQgR2FzIENvbXBhbnksIJNZb3VyIEVtYWlsIEFkZHJlc3MiIHdlcmUgc2VsZWN0ZWQgdGhy
b3VnaCBhIGNvbXB1dGVyIGJhbGxvdCBzeXN0ZW0gZHJhd24gZnJvbSBOaW5lIGh1bmRyZWQgdGhv
dXNhbmQgZW1haWwgZnJvbSBDYW5hZGEsIEF1c3RyYWxpYSwgVW5pdGVkIFN0YXRlcywgQXNpYSwg
RXVyb3BlLCBNaWRkbGUgRWFzdCwgQWZyaWNhIGFuZCBPY2VhbmljIGFzIHBhcnQgb2Ygb3VyIGlu
dGVybmF0aW9uYWwgcHJvbW90aW9ucyBwcm9ncmFtIHdoaWNoIGlzIGNvbmR1Y3RlZCBhbm51YWxs
eSwgd2UgaGF2ZSBvbmx5IHNlbGVjdGVkIDIwIHBlb3BsZSBhcyBvdXIgd2lubmVycywgdGhyb3Vn
aCBlbGVjdHJvbmljIGJhbGxvdCBTeXN0ZW0gd2l0aG91dCB0aGUgd2lubmVyIGFwcGx5aW5nLiAN
ClZFUklGSUNBVElPTiBBTkQgRlVORFMgUkVMRUFTRSBGT1JNDQoxLiBGdWxsIG5hbWU6CQkNCjIu
IEFkZHJlc3M6DQozLiBTZXggYW5kIEFnZQ0KNC4gU3RhdGU6IA0KNS4gVGVsZXBob25lIE51bWJl
cjoNCjYuIE9jY3VwYXRpb246IA0KNy4gRW1haWw6DQo4LlN0YW1wIFNpemUgUGhvdG86CQ0KOC4g
QmFuayBOYW1lLCBBY2MgTm8gYW5kIElmc2MgQ29kZToNClRvIGNsYWltIHlvdXIgcHJpemUsIHBs
ZWFzZSBmaWxsIGFuZCBzdWJtaXQgeW91ciB2ZXJpZmljYXRpb24gZm9ybSBpbW1lZGlhdGVseSB2
aWEgZW1haWwuIA0KRHIuIFJpY2hhcmQgRG9tbmljICAgd29ybGRjb2xhQGV1cm9wZS5jb20NCkZv
cmVpZ24gU2VydmljZSBNYW5hZ2VyIA0KQ29jYS1Db2xhIExvdHRlcnkgKFB2dCkgTHRkLiANClRl
bDogKzQ0NzQ0ODcyMjI2NjcNCkVtYWlsOiB3b3JsZGNvbGFAZXVyb3BlLmNvbQ0KSSB3YW50IHRv
IENvbmdyYXR1bGF0ZSBZb3UgSW4gQWR2YW5jZSBhbmQgUGxlYXNlIERvIE5vdCBGb3JnZXQgdG8g
SGVscCB0aGUgUG9vciBJbiB0aGUgU29jaWV0eSBXaGVuIENvY2EtQ29sYSBNYWtlcyBZb3UgYSBC
ZW5lZmljaWFyeSBPZiB0aGVpciBXb3JsZCBPZiBXZWFsdGguDQpDb25ncmF0dWxhdGlvbnMgb25j
ZSBhZ2FpbiAhISENCg==
--000000000000c6606405d25dd0dd--
