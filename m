Return-Path: <jailhouse-dev+bncBCALXNFHYEARBOOFYCKQMGQE7WUGWTY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C0B55118B
	for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Jun 2022 09:33:14 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id y4-20020aa7ccc4000000b0042df06d83bcsf8044115edt.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Jun 2022 00:33:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1655710394; cv=pass;
        d=google.com; s=arc-20160816;
        b=WBszlTGpc40PxtRUxAM9ZYhN8KoXyzYiESdm+00PBW/cIQWRLEfbgKyXzUyckRtqaa
         kocmeWk/xc7Zc5cS4OeTxIrN1IhbaqwcYT2/wW/r+8hxNYn/zfbertk0zb4xr/1G0UaG
         XczPQBftpziE0pWZ/kfeh0CP5rFwI8ke+UllSC3nXLJ6dsB263ly9QW5Chfz3zUlKPbx
         Gb2JZ9W7aFprNR6/2MvxgI2FCC9f3+X+vO3fQo5M9U7WZdvi2pt63SroV5ii9gv/d+Z0
         W1CWAY5eWkF/d1yTeoWY+NJPldNcXYeEU7ow5azGNWrZQU39XD7GB0yaczxTZ4jkvtPa
         up+Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:sender:dkim-signature
         :dkim-signature;
        bh=0MSRrg/RGQT7G//H0dbvpVS/C3ByLABW12bFal+ev3g=;
        b=CMxFfTZsW5oade//fIKICl6URpEOhGlFn0OvsQIl/+Ftzu8QpLxLylEMFsg73uvbFu
         4doXxsgdZWJOBjVF8Y7RCc+gdhfOiVPggz3KbwIZYSllrbmuWl5h2vHy0lVOzuTSoEh2
         vrTpEXrvDIAWBWKKo+Rv7BFVEmMvPZKmxyDnsgTKV8Shyi0EhrErtyYefZ8UpD9JZ8Yf
         tAs4voYPRPnhXfD9pfb9s3A1Cdfu9mHe3jRez/RXP8Gh5CWvQnN00T1xs76CwBHKnBc4
         31VW+ieZR1PsgGTYhux3gz9/dVBi/T3KdCq/EUG7DlMjb76PK8le7cL6S1mYO46sjFzp
         hlYA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="M9B6ds/Y";
       spf=pass (google.com: domain of barlettamarco8@gmail.com designates 2a00:1450:4864:20::534 as permitted sender) smtp.mailfrom=barlettamarco8@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:to:content-language
         :from:subject:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0MSRrg/RGQT7G//H0dbvpVS/C3ByLABW12bFal+ev3g=;
        b=Tsei2Vinv8bOi/PZCAkNWHUET9NY+JXRBnbfKOY6uLDr7yMlG6f2HNUBLxOzZaNPHz
         3UtMN0HBO2ncj39spEsaiF2dWdCnUAMx/c8/5L8bM5ttaWKwPpYBOteAmtwWtwbPSQSu
         26uB33lcuqAW4qL5DDu9G6wjYFcUD/bhtpt4HMe5i7hXFjFrGcdCihP1Bhoe8j+9UZL3
         s4rEIrNIrGrFaFRbR1No7Mx9LucqlJS3tfhi6xGP/YQvW3+V7T5zlJVLrnXL/t/z8Ax+
         h1G2569Cr4M8zfmsIT0azu49pczxCKWTSmdRPk9VWT0sb2KKqrifkEJ8LlxxDNc9CoWH
         JyCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:to:content-language:from
         :subject:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0MSRrg/RGQT7G//H0dbvpVS/C3ByLABW12bFal+ev3g=;
        b=iLmjIp9O0qm6wv+EznWwoNW0IL0biW4mAl4klnwesu73w+EzJ8UMPc+0SR5aYDZ5yF
         JmY9FlmblMmsyGQcy2HxNnOjIj7U6GB1BJrdiX2+VPivEMSJ1pXLrvOpVqDb/GdmT6qF
         gF7kWcdbIGVGJumI0/0EuTu3AEfbthstVPUQwrw3jho77FHLQyVVXravGK9p94nOaDkM
         ezDtd1J0vyRefCxXZ3ZUzhQwni7iAicZ/19jzph7cpfZkpPGsbPvtHMBmpdzhSVwqKVw
         CAzfg4NWXTUtCwqLHXC6d80hqyEH8Q4HlSxQb/IFCDRR/DCNZY1eTgRd+WQPlHGNDIAa
         6s8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :to:content-language:from:subject:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0MSRrg/RGQT7G//H0dbvpVS/C3ByLABW12bFal+ev3g=;
        b=eqOVrPFDRD1RNip58AI6ZHoWCEkW08auuUzRJFhy1dovbEYDAM59MxCcdVsBqTlAA5
         OOTeCMzfPG+Y1cDNDcJxTMpnGDLtosdXTnmr2LLzEVTEkTDomShe3VSVpAR251q3KDb5
         M6HOArXGALOj4ihBdud/egT0c0oxPzWocOiqziUdEew5x3JH/NqHG1vM0yis3NtGM8xP
         j9X2JnKbNHn6mcjvEkCRGuTfFlBE48MC5i2gUuJD+Ir/vY31H12Tt8JeX21InlG2+9LD
         33NzlEHMVZItRkJCoBWTycvPo/myJCjHuQomtFM5RrBD6i+RM88bWFcI/sVI2/9TU8sH
         3apA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora8v/udXmYiS+Fq1VHawcRC8ikI3fGjkozz7Mj6UFqD9iVBIWYTD
	LfYotPI7lxb5XLIz1XDWvGM=
X-Google-Smtp-Source: AGRyM1tg6QZOlgzKPOyKNCamPstrHRH6VNwyFxHxCn6JFVO5IQ7a45T8HSMnxJDaDTJGApQBT5l6mw==
X-Received: by 2002:a17:906:7395:b0:714:d36b:d7c with SMTP id f21-20020a170906739500b00714d36b0d7cmr19798718ejl.338.1655710393932;
        Mon, 20 Jun 2022 00:33:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:40c3:b0:435:89f5:289a with SMTP id
 z3-20020a05640240c300b0043589f5289als981964edb.3.gmail; Mon, 20 Jun 2022
 00:33:12 -0700 (PDT)
X-Received: by 2002:aa7:c14f:0:b0:435:7b75:fd06 with SMTP id r15-20020aa7c14f000000b004357b75fd06mr7491282edp.352.1655710392636;
        Mon, 20 Jun 2022 00:33:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655710392; cv=none;
        d=google.com; s=arc-20160816;
        b=gm3n7RQeCEfs9zJ06qX57EoLO5shO5EZb7QKHKLXCsDGYihttgTY+kNp0AvnCYiV+6
         cqxV12myToEZOeU4qOtFKT04qc1inkkLJjaSw3lEa0I3K/f33fERBfkC2OX+5kGY8BSq
         QCk9Y4mBd4+dZQLH8/FUpW3rAMFOklIXVwHLnM9VRMhEjpjcd2CULj+s3VJLhrcTalkS
         iYKiJBYVU0ebVNF2AkYDBUYiJLaueamuk8i+BALvfsHaAYzV3JiJAAnX7xolqoAhQvMq
         lif4uCjtsJYkK2cJ+3nAhBgX9ftIhpH1DWbcA1YzNs5IJ3vJ0O4reBWujz2kRqoIZcPU
         5UBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=W3xiUSzNRKTCJ4fy9ebaW6H+DMUlp2hUy1lhIGYVZzM=;
        b=xKslQ4Nv0EFIhzp7C68A1pLOOQxS/CPZqWkR4W6C0XdBaO2yXJxQ8KIIQdbeJ0/vsk
         iMAIe46GvujpfoVe8jpOc8SD7YtzkS749tIh8/1hV8vdWFGt0N+K330L4d7m+zGjL/9w
         /BIkf9cbr53oWA2nPejFk1tn0x5gHeM9/XpvGZRkpRLZ0pX9neGDiLUvjo4J3Ixh9oJf
         TYpc+epeujAYU8qc5wyDcBoVUBzeRxdGCuU9dsS4rbycrernFLSaj7V9rq7y71TrBLPn
         BzHc8Hqm7MiFQmOPZjTmOnZVEOV0HjmkdnFfExm/HMa6HBLOTZM7bZgCm7BS3r2ePzUz
         3jDg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="M9B6ds/Y";
       spf=pass (google.com: domain of barlettamarco8@gmail.com designates 2a00:1450:4864:20::534 as permitted sender) smtp.mailfrom=barlettamarco8@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com. [2a00:1450:4864:20::534])
        by gmr-mx.google.com with ESMTPS id el7-20020a056402360700b0042d687c85d2si450967edb.0.2022.06.20.00.33.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 00:33:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of barlettamarco8@gmail.com designates 2a00:1450:4864:20::534 as permitted sender) client-ip=2a00:1450:4864:20::534;
Received: by mail-ed1-x534.google.com with SMTP id c13so9366737eds.10
        for <jailhouse-dev@googlegroups.com>; Mon, 20 Jun 2022 00:33:12 -0700 (PDT)
X-Received: by 2002:aa7:d90c:0:b0:435:6d09:e342 with SMTP id a12-20020aa7d90c000000b004356d09e342mr13527965edr.359.1655710392362;
        Mon, 20 Jun 2022 00:33:12 -0700 (PDT)
Received: from [10.219.103.206] ([217.110.172.22])
        by smtp.gmail.com with ESMTPSA id eg40-20020a05640228a800b004356d82b129sm5270886edb.80.2022.06.20.00.33.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 00:33:11 -0700 (PDT)
Message-ID: <befbf4a6-dd9e-fc70-6fef-e3fe193184a7@gmail.com>
Date: Mon, 20 Jun 2022 09:33:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
To: jailhouse-dev@googlegroups.com
Content-Language: en-US
From: Marco Barletta <barlettamarco8@gmail.com>
Subject: Error with Jailhouse Demo Images
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-Original-Sender: barlettamarco8@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b="M9B6ds/Y";       spf=pass
 (google.com: domain of barlettamarco8@gmail.com designates
 2a00:1450:4864:20::534 as permitted sender) smtp.mailfrom=barlettamarco8@gmail.com;
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

Dear all;

I was trying to build JH for QEMU with the kas container in jailhouse 
demo images. Suddenly the building failes due to this error:

git -c core.fsyncobjectfiles=0 ls-remote 
git://github.com/siemens/jailhouse failed with exit code 128, output:
2022/06/20 07:26:47 socat[251] E connect(5, AF=2 140.82.121.3:9418, 16): 
Connection timed out
fatal: Could not read from remote repository.

(Yes I have internet connection, of course, and the IP correctly 
responds to ping).

Any advice? Has something changed with the git protocol?

Best regards.

Marco

-- 
--Marco Barletta--

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/befbf4a6-dd9e-fc70-6fef-e3fe193184a7%40gmail.com.
