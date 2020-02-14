Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBIONTTZAKGQEOICJ5TI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E7D15FA28
	for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 00:00:50 +0100 (CET)
Received: by mail-lj1-x23a.google.com with SMTP id y24sf3865367ljc.19
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Feb 2020 15:00:50 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581721249; cv=pass;
        d=google.com; s=arc-20160816;
        b=0OGK9QQM6o4ZR2zVNMTTLpVPTqU+BHNRF7ni7T7bEojEIEamCDts5HLR2rKuwj2sx0
         9uQQbwENxMw6YwFmoqZZlMKugvXTFm4DX7ldh7/EES+D81zOAb6n+1bVi3dxAajdGdcr
         14zsvD7JUTSItITubtPBhgMo0v+ZDemeh1AzQcxLRdwl5zyy39kv8qsS2mVOxiJp51p6
         TdzF/NwYi0uFy5JbMT2dnmmsaXWxmbrwIhJeiJKkZW3pCUkpFxvFsHIvCLJrY32OnTOc
         TQ8ZUQBH6JHQ6WuyQS2WnD1hGZw5Y9eOQX0bj/OdYOrznXNcLvXtfXHhifnVOH4jLmjt
         zRFA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=RzN+GW+PXXIrNNrV8bqvEoFkbFwRXHhBd1hzWfk5xXQ=;
        b=d4+BTJwXKaUkOrOyBGcVnnrstgk3UkpFSy+Q891W9BYAcUoWfCE54atDf7FxBcYMjJ
         W2qVujWmZ72Sl5JCrxLH6iiQQekl8NEFJz4W5w8rj17hbm9JSeoEekEV4kUIHxySHg4f
         7dWstksgZz08Ar8f6RCRqCdHk/ZFIV4t0iYdlEYOT4qcVio/bVAu7ZLvM14uhWWm+8Ht
         OdMvWziMNj0iz4nu+3x8iw55/AUmUWmZW+Sn1a5VWVJVpauXETunsDcqvaVhCvEpVecT
         JIGY5Wc7A7T0JHmbHl2EZKpokb2C4OkWdiJeAv+GZPKiMPhDPDmOv6wDq6oS/0VZKoie
         lF4w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=dQWF0pXB;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=RzN+GW+PXXIrNNrV8bqvEoFkbFwRXHhBd1hzWfk5xXQ=;
        b=pc4hX1QZlsEEwox8oJbpBGH9kKSY3DR46atgiwntRHguZsWq/MDq3A+7mn/JlueBd+
         0t4lwm/PsmkLb4wkg/qrraVoxM8z5vKed/VstA8Uldrj6I/NLTt4cl4aXFtWmiiztlf0
         6V9wFhreHu7nh0Q78DA+JmO26CI00kP1eJse9xN9v1s5mJcIdehjAnyWODEb2xPImsdj
         Dw129/qDyf8s46+U2BGizxmvKjbsWtbv3FkFiBU17aJtUJh2zT2DwIqrzUN3hpu5i/op
         NYOJZ9HmVwXRLQB112pAoyffSFg9pYsYoPzU9LR87k0xEg7Bh5mFaJfWoRt6Yw4Y2i4F
         eDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=RzN+GW+PXXIrNNrV8bqvEoFkbFwRXHhBd1hzWfk5xXQ=;
        b=rg5KKJkP7kT/Vq7nfXkeezFMlyXLarymt42Hb36kY2bA8VCgZR0WruIlCGRF9k1nmi
         PahQBswm/KwqCwSQZdZk0kigDgLmt3I6fvtcYeL+xBc1F2fko5PCQuRK7Rb7pTFNEDSo
         xUxgRjwlWLhQRdCmgQEDTnfJvjTCZwlsm9mj7l2GBvEtE1J+OR1x6xA+mTqK9HmCBa9Q
         biK5mN2DfQnO5uTw9Yovna3mR6kIuQ43C93WZ8nOP8qi8Thm9elpXN+iLG77kMcK1Zmf
         fXZUOrCKj/b3OZfVgU9Nz8qqpAwOjWOcDlFyKMtFPt3ASRva3K0hkbcdTIPvdXEwz4kX
         xgog==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW4Cl2DUEobXYT5nbNaymHgYBNb7EWNr91QCliK8XWkDkx4IjCa
	fB25C80FsEMV5PNBHMkJC9g=
X-Google-Smtp-Source: APXvYqyjeTjjo/IeNjUUtJvpapuLFvPX5rQPxIo4xArtucmyaqjP3qEBXRP/EllJdkPnEVKkTnJdNQ==
X-Received: by 2002:a2e:9a11:: with SMTP id o17mr3306760lji.256.1581721249317;
        Fri, 14 Feb 2020 15:00:49 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:1051:: with SMTP id x17ls743462ljm.8.gmail; Fri, 14
 Feb 2020 15:00:48 -0800 (PST)
X-Received: by 2002:a2e:9050:: with SMTP id n16mr3410326ljg.49.1581721248558;
        Fri, 14 Feb 2020 15:00:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581721248; cv=none;
        d=google.com; s=arc-20160816;
        b=SkzdMLNVKdoCTWPswXgUQpXw4YU+UQCzs47j9WmdhuImRWJzQJ8Rc0eiYntjmFsDLs
         aehp+wB1nbnbm5wuAwMEuZrYpibfOQhVqMs2PXZOOBCN5hYbVzpQ7ZHXd/f1AFCH1uVj
         mpWu7Ec8mAYdzS3Vq8dRKU7bVnjjobN8B+HXar2Uk5yjpfj2PkB8LxwYf78/QkiJG38D
         dAGxu1mKXjNrW6U0XTdPSZRvkstFmzrXVIGYtiMok6iXMAi+6i24NHUo66g4C2NC7V0x
         7LH6F287zgpTYuORQhnGmEmIuWXPJfp1gqvZTv9zNuxm5QLo8K2xCxZEX01+EQQfdJeC
         uzsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=5CmN0f9nlLLAVCjjMElq9tG264OdBb9OvuCY8kSGsqU=;
        b=YPNTCA0qam82mRC/c604NhdURG4/1eCbWRXSo2ViE/TIs8Fphasy4PWZhR2VCGWh8N
         DXdPli07fZqCkdKqYheX70ovohrFi7X34FgU3QxSW9ArDgv7mBJZhyj5lp4p0FsRwUxi
         wluxbg4p2bDpOyqS11tAc26sHk7T8yNxcuHGc/8RPL350cgNGXJcljncahRIvujB8ZZO
         W3HSLL4BpPHNRxF9F7O7upqXMIaNqLXR3aHnrg2RZjOZhsAbYhYvjVTFCu7TepGJ2lVY
         VNWBkRem5tVpz7mzTaB4gvPRe6FwFDWjKnjnBvv/CSfmzu8N2kmf7uYpZKeeNEMWbzSq
         Bh4Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=dQWF0pXB;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id o24si366534lji.4.2020.02.14.15.00.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Feb 2020 15:00:48 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M4I2R-1jJidY0OMF-00rp8n; Sat, 15
 Feb 2020 00:00:47 +0100
Subject: Re: Strange newlines for console output
To: Michael Hinton <michael.g.hinton@gmail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <0d86ac87-9d3c-42c4-b499-af40aa76d302@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <eae57764-d282-e692-f113-b3360c6a06ad@web.de>
Date: Sat, 15 Feb 2020 00:00:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <0d86ac87-9d3c-42c4-b499-af40aa76d302@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ug0jE+o1P5ysJ6pJLfoMJpflklt1Lj0gvCnHpvyZkeXpa8YEOpC
 kljEooR1wpHce4XLw1i3tUuj0xnHwn28M7yzx4321uCBZIiGtRcjNaVOIE2qPFa9sHhbmJy
 TViZSGTDC9LiynZPtzhYAVNA8T+HqTiq1/4XGGTyDN2ifcQeVWiKNkaMoD0osG6tGk6rVBG
 /B7c9y3/TelwjjsZTBlVw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qAPNe3s/xew=:4F73AVCn6vgR4ENZzZ3buf
 RaN+iiUCGTot9XQd8unvHMc+HSHzQYuXxTXQCGXJkK/I+LJxuy/qTfgQNIXDWklLN4ia/Y/87
 Fhd60wpANXwLmIQBGJfNeb0SilB7QEeo8+eA1lfS3mHakFhBzeB+ka4sWGWpd/OF2lKMUbxiK
 3c5NVv/6Ng69ljYnn+UVvbh725V7Lt90fC7pCCekiNDAVQ3s20XBCRgct6aaQv++AGkl4bbPS
 nNxDe+pyDIkD06OdXEjGCSv8/h3Y9Co0ueosCo+H8rONrHbCU1due5ffOgCtoL/Fsmk6BfuCY
 njy9NccxYsXwkRAKvNKVyBN32KF2yWZ5W8jN4sKUbjU+7vnFkzYBIyOmpE+ehA5edS/CVQ2T1
 a1IYJMjwvY7dwdDGWa7Z6KSO84vHe791YDXwr8seRfh9lJ3zERlFomEvvDxqcELL2ecbVqYRv
 idAzns9EjJYbIuHpALODJtaWhtG+bf0XMKsPgcJ2F9QTk7p0ilcbUEt8K8aM6j6bahRmLvW0x
 SK0bojs98WbCLOyXOwwX+BVpnlXg/4UgEZL8dM/tk7G/wVRn1J0qs5FuGKprBcDArmxOwct0v
 GIWzFzs5R8Y0905b0zvu+8NkwYaV5URh3vO7tDU3FHbltU1vUImxRB1X7VxhhbKwpQkTxhVNV
 gnFTHZuSwrkuDmQiF0RYocM8Xws6qjarDsXMEpLvcYduW2og3xQZ88eJZLO6B4gyLGN+RCDZ2
 tf2aKjkzkIW3dVr65y+BAtoLAWln7tmxsgI4T8blGW8cWASjKgmJbnP+0u5thv7z4W1Se3yYo
 pB+H5g00USZMMuT7e0xfYmuG3VwDfjnLs6BnrjlzBDB29lKXdbgJag2IWqhvfM2VfW0ZBv0YW
 r2+toMpg7yBVqBp255rxkonw3YDjauaOwDT4olW+RfnyFGGNgrORSphDfBE6VNO2FlJVO5UcX
 tfV4NMfWBAp7tYxdb1daMGQsstre8zHyzg6e8gZ72Wwr6WAnanupmGbC8ELj10ky1A1sjR7Py
 uFkTIJ0JvPehtA3F0AiyUjTmiqwKLdjbLDfD7dULe3riU6UpQh8fa8vHXOt3vMWlVTzsXESex
 sTeHGi6F4yG+vYmhUHrQlynp+U31662vaDRHFMjbUfCbEOgyu2XFE04kKykjWFuVilb6sm37p
 XEfW6XI29ArOt8N9IIXO2YXyCj0gJbvkwitcZmxAtHugaF/Cwshb9FzDgEYvlMLPKL9+3P0U2
 jGXc65AEvkA+77Pm3
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=dQWF0pXB;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 14.02.20 21:42, Michael Hinton wrote:
> Hello,
>
>
> I wanted to get some feedback on how Jailhouse is implementing newlines
> for console printing.
>
>
> Here's the code:
>
> https://github.com/siemens/jailhouse/blob/92db71f257fabd3c08fa4b99498fa61=
a41ea831d/inmates/lib/printk.c#L60-L63
>
> https://github.com/siemens/jailhouse/blob/92db71f257fabd3c08fa4b99498fa61=
a41ea831d/hypervisor/uart.c#L25-L28
>
>
> You can see that the code is doing this:
>
>
> if (c =3D=3D '\n')
>
> c =3D '\r';
>
> else
>
> c =3D *msg++;
>
>
> So if the last character printed was '\n'(the Line Feed character), this
> code injects an '\r'(the Carriage Return character). I=E2=80=99m assuming=
 the
> reason for this is just in case the console output is on Windows.
> Looking through the git history, it looks like this pattern has been in
> Jailhouse since the very beginning.
>
>
> This seems incorrect to me. The thing is, Windows newlines are CR+ LF,
> in that order, while Jailhouse is printing LF+ CR, which doesn=E2=80=99t =
match
> Unix _or_ Windows. See
> https://en.wikipedia.org/wiki/Newline#Representation. However, maybe
> there is a good reason for this that I don=E2=80=99t see yet.
>
>
> I=E2=80=99m consuming the Jailhouse console output in Linux, not Windows,=
 but
> this still causes trouble because the extra CRafter the LFcan mess up
> awk (and possibly other line-based parsing tools). For more details, see
> https://stackoverflow.com/questions/60203007/awk-is-only-matching-the-fir=
st-line-when-matching-against-first-column.
>
>
> One solution is to reverse the order: inject CR _before_ printing LF.
> Another solution is to not inject CR at all, and leave it to the users
> of printk() to manually insert CR when needed.
>
>
> Let me know what you all think.
>

Well, we need the CR because we are also writing to real UARTs. If there
are tooling issues with the current reverse order (which was simpler to
implement IIRC), we can flip that, e.g. like  this:

diff --git a/hypervisor/uart.c b/hypervisor/uart.c
index a43773c2..4f4eba4e 100644
--- a/hypervisor/uart.c
+++ b/hypervisor/uart.c
@@ -19,16 +19,19 @@ struct uart_chip *uart =3D NULL;

 void uart_write(const char *msg)
 {
-	char c =3D 0;
+	char c, cached_c =3D 0;

 	while (1) {
-		if (c =3D=3D '\n')
-			c =3D '\r';
-		else
-			c =3D *msg++;
+		c =3D cached_c ? : *msg++;
 		if (!c)
 			break;

+		cached_c =3D 0;
+		if (c =3D=3D '\n') {
+			cached_c =3D c;
+			c =3D '\r';
+		}
+
 		while (uart->is_busy(uart))
 			cpu_relax();
 		if (panic_in_progress && panic_cpu !=3D phys_processor_id())

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/eae57764-d282-e692-f113-b3360c6a06ad%40web.de.
